# aks-csi-driver-azure-blob-inspection

## Overview
creating AKS environment to try Azure BLOB CSI Driver

refs -> https://learn.microsoft.com/ja-jp/azure/aks/azure-csi-blob-storage-provision

## steps to provisinoning


1, Initialize terraform for `azure` directory

```
terraform -chdir=azure init
```

2, Deploy Azure resources

```
terraform -chdir=azure apply
```


4, keep the output result

```
azure_blob_container_name_for_helm       = "container9d61d21992a5999f"
azure_resource_group_name_for_helm       = "aks-azure-blob-csi-rg-westus"
azure_storage_account_name_for_helm      = "csiblob9d61d21992a5999f"
kubernetes_namespace_for_helm            = "csiblob"
kubernetes_service_account_name_for_helm = "csiblob-sa"
azure_aks_kubelet_id_client_id_for_helm  = "f9f07b1f-b0bb-42c9-81dd-357c830a257e"
```

4, set cluster context to local `.kube/config` file

```
az aks get-credentials -n { value of 'aks_cluster_name' from step 3 } -g { value of 'aks_cluster_resource_group_name' from step 3 }
```

5, get kubelet identity client id

```
az aks show -n csi-azureblob -g aks-azure-blob-csi-rg-westus --query "identityProfile.kubeletidentity.clientId"
```

6, assign "Storage Blob Data Contributor" role to kubelet identity client id (id determined with id fetched on step 5) on storage account 



7, create `helm/terraform.tfvars` file with the output of step 3, as below.


```
azure_blob_container_name_for_helm       = "containerXXXXXXXXX"
azure_resource_group_name_for_helm       = "aks-azure-blob-csi-rg-westus"
azure_storage_account_name_for_helm      = "csiblobXXXXXXXXX"
kubernetes_namespace_for_helm            = "csiblob"
kubernetes_service_account_name_for_helm = "csiblob-sa"
azure_aks_kubelet_id_client_id_for_helm  = "<result of step 5.>"
```

8, Initialize terraform for `helm` directory

```
terraform -chdir=helm init
```

9, Deploy Kubernetes resources
```
terraform -chdir=helm apply
```

10, check the pod running on `default` namespace, and confirm if you can retrieve the files uploaded on the azure files from Pods file system [ `/mnt/blob` ]

example command
```
kubectl exec -it demo-app-XXX-XXX -- ls /mnt/blob
```

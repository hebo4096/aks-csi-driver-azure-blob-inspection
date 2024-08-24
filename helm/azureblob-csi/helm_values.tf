resource "helm_release" "azureblob_csi" {
  name  = "azureblob-csi"
  chart = "${path.root}/helm-chart"

  set {
    name  = "csi.azureResourceGroupName"
    value = var.azure_resource_group_name
  }

  set {
    name  = "csi.azureStorageAccountName"
    value = var.azure_storage_account_name
  }

  set {
    name  = "csi.azureBlobContainerName"
    value = var.azure_blob_container_name
  }

  set {
    name  = "csi.azureStorageIdentityClientID"
    value = var.azure_blob_storage_id_client_id
  }

  set {
    name  = "namespace"
    value = var.kubernetes_namespace
  }

  set {
    name  = "demoApp.serviceAccountName"
    value = var.kubernetes_service_account_name
  }
}

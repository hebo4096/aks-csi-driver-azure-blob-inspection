resource "kubernetes_namespace" "this" {
  metadata {
    name = var.kubernetes_namespace_for_helm
  }
}

module "azureblob_csi" {
  depends_on = [kubernetes_namespace.this]
  source     = "./azureblob-csi"

  azure_resource_group_name       = var.azure_resource_group_name_for_helm
  azure_storage_account_name      = var.azure_storage_account_name_for_helm
  azure_blob_container_name       = var.azure_blob_container_name_for_helm
  azure_blob_storage_id_client_id = var.azure_aks_kubelet_id_client_id_for_helm
  kubernetes_namespace            = var.kubernetes_namespace_for_helm
  kubernetes_service_account_name = var.kubernetes_service_account_name_for_helm
}

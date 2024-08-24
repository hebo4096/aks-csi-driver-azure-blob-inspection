# Use this output for getting credentials for AKS.
output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "aks_cluster_resource_group_name" {
  value = azurerm_resource_group.this.name
}

# outputs used for installation of azurefile csi helm release
output "azure_resource_group_name_for_helm" {
  value = azurerm_resource_group.this.name
}

output "azure_storage_account_name_for_helm" {
  value = module.azureblob.azure_storage_account_name
}

output "azure_blob_container_name_for_helm" {
  value = module.azureblob.azure_blob_container_name
}

output "kubernetes_namespace_for_helm" {
  value = var.namespace
}

output "kubernetes_service_account_name_for_helm" {
  value = var.service_account_name
}

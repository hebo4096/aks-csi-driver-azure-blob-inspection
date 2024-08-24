output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "kubelet_id_client_id" {
  value = azurerm_kubernetes_cluster.this.kubelet
}

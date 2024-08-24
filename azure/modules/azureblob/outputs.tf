output "azure_storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "azure_blob_container_name" {
  value = azurerm_storage_container.this.name
}

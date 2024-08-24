resource "random_id" "azureblob" {
  byte_length = 8
}

resource "azurerm_storage_account" "this" {
  name                = "csiblob${random_id.azureblob.hex}"
  location            = var.location
  resource_group_name = var.rg_name

  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "BlockBlobStorage"
}

resource "azurerm_storage_container" "this" {
  name                  = "container${random_id.azureblob.hex}"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "blob"

  depends_on = [
    azurerm_storage_account.this
  ]
}

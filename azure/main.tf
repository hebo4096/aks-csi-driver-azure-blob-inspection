resource "azurerm_resource_group" "this" {
  name     = "aks-azure-blob-csi-rg-${var.location}"
  location = var.location
}

# modules related to Azure Kubernetes Service (AKS)
module "aks" {
  source = "./modules/aks"

  rg_name  = azurerm_resource_group.this.name
  location = var.location
}

# modules related to Azure Files
module "azureblob" {
  source = "./modules/azureblob"

  location = var.location
  rg_name  = azurerm_resource_group.this.name
}


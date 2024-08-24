resource "azurerm_kubernetes_cluster" "this" {
  name                = "csi-azureblob"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "csi-azureblob"

  # required kubernetes version under enable azure workload identity
  # see -> https://github.com/Azure/azure-workload-identity
  kubernetes_version = "1.29"

  # Node Pool settings
  default_node_pool {
    name       = "defaultnp"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  # ID settings
  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled = true

  # Storage settings
  storage_profile {
    blob_driver_enabled = true
  }
}

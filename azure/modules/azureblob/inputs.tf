variable "location" {
  type        = string
  description = "azure region to deploy resources (ex. 'japaneast', 'eastus')"
}

variable "rg_name" {
  type        = string
  description = "resource group name for this project"
}

variable "azure_resource_group_name" {
  type        = string
  description = "resource group  of where azure storage account exists"
}

variable "azure_storage_account_name" {
  type        = string
  description = "name of Azure Storage Account"
}

variable "azure_blob_container_name" {
  type        = string
  description = "name of Azure Files Share"
}

variable "azure_blob_storage_id_client_id" {
  type        = string
  description = "client ID to access Azure Storage"
}

variable "kubernetes_namespace" {
  type = string
}

variable "kubernetes_service_account_name" {
  type = string
}

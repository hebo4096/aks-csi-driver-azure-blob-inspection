variable "azure_resource_group_name_for_helm" {
  type        = string
  description = "set the value of 'azure_resource_group_name_for_helm'"
}

variable "azure_storage_account_name_for_helm" {
  type        = string
  description = "set the value of 'azure_storage_account_name_for_helm'"
}

variable "azure_aks_kubelet_id_client_id_for_helm" {
  type = string
}

variable "azure_blob_container_name_for_helm" {
  type        = string
  description = "set the value of 'azure_storage_account_key_for_helm'"
}

variable "kubernetes_namespace_for_helm" {
  type = string
}

variable "kubernetes_service_account_name_for_helm" {
  type = string
}

variable "kube_config" {
  type        = string
  default     = "~/.kube/config"
  description = "location of kubeconfig file. If you have custom location, change the default value"
}

variable "resource_group_name" {
  default = "rg-sre-springboot-prod"
  type    = string
}

variable "location" {
  default = "southeastasia" # Change to your preferred Azure region
  type    = string
}

variable "cluster_name" {
  default = "aks-sre-cluster"
  type    = string
}

variable "acr_name" {
  default = "acrsrespringboot01" # Must be globally unique, lowercase, letters/numbers only
  type    = string
}
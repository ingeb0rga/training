# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "container/terraform.tfstate"
#   }
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#     }
#   }
# }

# provider "azurerm" {
#   features {
#   }
#   client_secret = data.terraform_remote_state.global.outputs.CLIENT_SECRET
# }

# data "terraform_remote_state" "global" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "global_vars/terraform.tfstate"
#   }
# }

# data "terraform_remote_state" "storage" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "storage/terraform.tfstate"
#   }
# }

resource "azurerm_storage_container" "devops" {
  count                 = length(var.storage_container_name)
  name                  = var.storage_container_name[count.index]
  storage_account_name  = var.storage_account
  container_access_type = var.access_type
}
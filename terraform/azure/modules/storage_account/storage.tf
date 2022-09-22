# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "storage/terraform.tfstate"
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

# data "terraform_remote_state" "resource_group" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "resource_group/terraform.tfstate"
#   }
# }

resource "azurerm_storage_account" "devops" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
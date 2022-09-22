# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "resource_group/terraform.tfstate"
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

resource "azurerm_resource_group" "devops" {
  name     = var.rg_name
  location = var.location
}
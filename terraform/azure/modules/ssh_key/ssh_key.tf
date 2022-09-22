# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "ssh_key/terraform.tfstate"
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

# data "terraform_remote_state" "keyvault" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "keyvault/terraform.tfstate"
#   }
# }

resource "azurerm_key_vault_key" "devops" {
  count        = length(var.keys)
  name         = var.keys[count.index]
  key_vault_id = var.key_vault_id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
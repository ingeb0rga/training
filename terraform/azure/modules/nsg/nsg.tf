# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "nsg/terraform.tfstate"
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

resource "azurerm_network_security_group" "devops" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
  location            = var.location

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
}

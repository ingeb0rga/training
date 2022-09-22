# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "vnet/terraform.tfstate"
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
#   # client_secret = data.terraform_remote_state.global.outputs.CLIENT_SECRET
#   client_secret = var.CLIENT_SECRET
# }

# variable "CLIENT_SECRET" {
#     default = ""
# }

# data "terraform_remote_state" "global" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "terraform"
#     storage_account_name = "terraformspirt"
#     container_name       = "terraform"
#     key                  = "project_az/terraform.tfstate"
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

resource "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  # location            = "westeurope"
  address_space       = [var.vnet_cidr]

  dynamic "subnet" {
    for_each = var.subnet_list
    content {
      address_prefix = subnet.value["cidr"]
      name           = subnet.value["name"]
    }
  }
}

data "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  resource_group_name = var.rg_name

  depends_on = [
    azurerm_virtual_network.test
  ]
}

data "azurerm_subnet" "test" {
  name                 = local.subnets[0]
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.test.name

  depends_on = [
    azurerm_virtual_network.test
  ]
}

locals {
  subnets = data.azurerm_virtual_network.test.subnets
  subnet_id      = data.azurerm_subnet.test.id
}
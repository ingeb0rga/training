terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "vnet/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {
  }
  client_secret = data.terraform_remote_state.global.outputs.CLIENT_SECRET
}

data "terraform_remote_state" "global" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "global_vars/terraform.tfstate"
  }
}

data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "resource_group/terraform.tfstate"
  }
}

resource "azurerm_virtual_network" "terraform" {
  name                = var.vnet_name
  resource_group_name = data.terraform_remote_state.resource_group.outputs.rg_name
  location            = data.terraform_remote_state.global.outputs.location
  address_space       = [var.vnet_cidr]

  dynamic "subnet" {
    for_each = var.subnet_list
    content {
      address_prefix = subnet.value["cidr"]
      name           = subnet.value["name"]
    }
  }
}
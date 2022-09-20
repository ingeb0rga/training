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
  name                = "vnet"
  resource_group_name = data.terraform_remote_state.global.outputs.rg_name
  location            = data.terraform_remote_state.global.outputs.location
  address_space       = ["192.168.0.0/16"]

  subnet {
    address_prefix = "192.168.1.0/24"
    name           = "subnet1"
  }
  
  subnet {
    address_prefix = "192.168.2.0/24"
    name           = "subnet2"
  }
}
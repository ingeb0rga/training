terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "resource_group/terraform.tfstate"
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
  config  = {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "global_vars/terraform.tfstate"    
  }
}

resource "azurerm_resource_group" "devops" {
  name     = var.rg_name
  location = data.terraform_remote_state.global.outputs.location
}
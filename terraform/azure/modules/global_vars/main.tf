terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "global_vars/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}

  client_secret = data.terraform_remote_state.global.outputs.CLIENT_SECRET  
}

output "location" {
  value = "westeurope"
}

output "CLIENT_SECRET" {
  value = ""
}

output "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   value = {
      owner       = "devops"
      environment = "dev"
   }
}
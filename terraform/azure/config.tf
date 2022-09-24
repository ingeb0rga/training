terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "project_az/terraform.tfstate"
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

  client_secret = var.CLIENT_SECRET
}
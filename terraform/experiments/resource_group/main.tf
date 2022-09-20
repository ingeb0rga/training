provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "resource_group/terraform.tfstate"
  }
}

resource "azurerm_resource_group" "devops" {
  location = ""
}
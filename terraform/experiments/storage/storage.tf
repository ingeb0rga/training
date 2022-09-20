provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "storage_account/terraform.tfstate"
  }
}

resource "azurerm_storage_account" "devops" {
  name                     = "terraformspirt"
  location                 = var.location
  resource_group_name      = var.resource_group
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "devops" {
  count                 = length(var.storage_container_name)
  name                  = var.storage_container_name[count.index]
  storage_account_name  = azurerm_storage_account.devops.name
  container_access_type = "private"
}
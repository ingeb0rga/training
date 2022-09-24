provider "azurerm" {
  features {
  }

  client_secret = var.CLIENT_SECRET
}

variable "CLIENT_SECRET" {
  default = ""
}

resource "azurerm_resource_group" "test" {
  location = "westeurope"
  name = "import"
}
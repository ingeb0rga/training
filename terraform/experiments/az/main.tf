provider "azurerm" {
  features {
  }

  client_secret = var.CLIENT_SECRET
}

provider "null" {}

provider "kubernetes" {}

provider "random" {}

provider "tls" {}

provider "cloudinit" {}
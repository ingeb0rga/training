provider "azurerm" {
  features {
  }

  client_secret = var.CLIENT_SECRET
}

provider "aws" {
  region = "eu-central-1"
}

provider "null" {}

provider "kubernetes" {}

provider "random" {}

provider "tls" {}

provider "cloudinit" {}
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "secret/terraform.tfstate"
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

data "terraform_remote_state" "keyvault" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform"
    storage_account_name = "terraformspirt"
    container_name       = "terraform"
    key                  = "keyvault/terraform.tfstate"
  }
}

resource "random_password" "pass_gen" {
    count = length(var.secret_names)
    length = var.secret_length
    special = true
}

resource "azurerm_key_vault_secret" "devops" {
    count        = length(var.secret_names)
    name         = var.secret_names[count.index]
    value        = random_password.pass_gen[count.index].result
    key_vault_id = data.terraform_remote_state.keyvault.outputs.key_vault_id
}


data "azurerm_key_vault_secrets" "devops" {
  key_vault_id = data.terraform_remote_state.keyvault.outputs.key_vault_id

  depends_on = [azurerm_key_vault_secret.devops]
}
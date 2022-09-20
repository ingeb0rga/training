provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

#   subscription_id = var.subscription_id
#   client_id       = var.client_id
#   client_secret   = var.CLIENT_SECRET
#   tenant_id       = var.tenant_id
}

resource "random_password" "pass_gen" {
    count = length(var.secret_names)
    length = 12
    special = true
}

# resource "random_string" "pass_gen" {
#   length = 12
#   special = true
# }

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "devops" {
  name                        = "spirtTerraformKeyVault"
  location                    = var.location
  resource_group_name         = var.azurerm_resource_group
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = [
      "Backup",
      "Create",
      "Delete",
      "DeleteIssuers",
      "Get",
      "GetIssuers",
      "Import",
      "List",
      "ListIssuers",
      "ManageContacts",
      "ManageIssuers",
      "Purge",
      "Recover",
      "Restore",
      "SetIssuers",
      "Update"
    ]

    key_permissions = [
      "Backup",
      "Create",
      "Decrypt",
      "Delete",
      "Encrypt",
      "Get",
      "Import",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Sign",
      "UnwrapKey",
      "Update",
      "Verify",
      "WrapKey"
    ]

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = [
      "Backup",
      "Delete",
      "DeleteSAS",
      "Get",
      "GetSAS",
      "List",
      "ListSAS",
      "Purge",
      "Recover",
      "RegenerateKey",
      "Restore",
      "Set",
      "SetSAS",
      "Update"
    ]
  }
}

resource "azurerm_key_vault_secret" "devops" {
    count        = length(var.secret_names)
    name         = var.secret_names[count.index]
    # name         = element(var.secret_names, count.index)
    value        = random_password.pass_gen[count.index].result
    key_vault_id = azurerm_key_vault.devops.id
}

locals {
  secname = "azurerm_key_vault_secret.devops.name"
}

data "azurerm_key_vault_secrets" "devops" {
  key_vault_id = azurerm_key_vault.devops.id

  depends_on = [azurerm_key_vault_secret.devops]
}

resource "azurerm_key_vault_key" "devops" {
  count = length(var.keys)
  name         = var.keys[count.index]
  key_vault_id = azurerm_key_vault.devops.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

output "secrets" {
    value = data.azurerm_key_vault_secrets.devops.names
}

output "keys" {
    value = [
        for key in azurerm_key_vault_key.devops : key.public_key_pem
    ]
}
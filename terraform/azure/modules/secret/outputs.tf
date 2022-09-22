output "secrets" {
    value = data.azurerm_key_vault_secrets.devops.names
}
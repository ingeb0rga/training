output "keys" {
    value = [
        for key in azurerm_key_vault_key.devops : key.public_key_pem
    ]
}
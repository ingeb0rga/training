output "vm_id" {
  value = azurerm_linux_virtual_machine.devops.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.devops.name
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.devops.public_ip_address
}
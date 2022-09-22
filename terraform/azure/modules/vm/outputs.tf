output "public_ip" {
  value = azurerm_linux_virtual_machine.terraform.public_ip_address
}
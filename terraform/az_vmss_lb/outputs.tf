# output "vm_id" {
#   value = azurerm_linux_virtual_machine.devops.id
# }

# output "vm_name" {
#   value = azurerm_linux_virtual_machine.devops.name
# }

output "devops_vm_public_ip" {
  value = azurerm_linux_virtual_machine.devops.public_ip_address
}

output "devops_vm__public_ip_fqdn" {
   value = azurerm_public_ip.devops.fqdn
}
output "vmss_public_ip" {
   value = azurerm_public_ip.lb.ip_address
}
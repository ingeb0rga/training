output "vmss_public_ip" {
   value = azurerm_public_ip.lb.ip_address
}
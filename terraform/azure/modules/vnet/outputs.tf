output "vnet_name" {
  value = azurerm_virtual_network.test.name
}

# output "subnet_list" {
#   value = azurerm_virtual_network.terraform.subnet
# }

output "subnets" {
  value = local.subnets
}

output "subnet_id" {
  value = local.subnet_id
}
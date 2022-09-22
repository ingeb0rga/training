output "container_name" {
  value = tolist(azurerm_storage_container.devops[*].name)
}
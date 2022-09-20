provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.CLIENT_SECRET
  tenant_id       = var.tenant_id
}

# data "azurerm_images" "devops" {
#   resource_group_name = var.azurerm_resource_group
# }

# data "azurerm_image" "search" {
#   name_regex = "M*"
#   resource_group_name = var.azurerm_resource_group
# }

# output "image_id" {
#   value = data.azurerm_image.search.id
# }

data "azurerm_shared_image" "example" {
  name                = "my-image"
  gallery_name        = "communityGalleryImageId"
  resource_group_name = "example-resources"
}
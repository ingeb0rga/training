variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "The values for each NSG rule"
}

variable "location" {
  default = "westeurope"
}

variable "CLIENT_SECRET" {
  type = string
}

variable "azurerm_resource_group" {
  default = "devops-rg"
}

variable "azurerm_virtual_network" {
  default = "devops-vnet"
}

variable "subscription_id" {
  default = "f1991654-3b2e-45ef-8814-9c357a7e88c6"
}

variable "client_id" {
  default = "af90d886-bfe0-4910-bfab-5c13f93d7942"
}

variable "tenant_id" {
  default = "2b38acf2-0a98-49af-a8a5-450b81fc916a"
}

variable "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   type        = map(string)
   default = {
      environment = "devops"
   }
}

variable "application_port" {
   description = "Port that you want to expose to the external load balancer"
   default     = 80
}
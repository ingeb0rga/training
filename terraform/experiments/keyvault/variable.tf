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
  default = "20e9da58-4e8e-4e10-9645-4231c6f01be5"
}

variable "client_id" {
  default = "416539b7-da04-4c50-8582-d35d1d60987b"
}

variable "tenant_id" {
  default = "87a45e48-5f0d-4c9f-9dc5-5e6705f5bf4b"
}

variable "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   type        = map(string)
   default = {
      owner       = "devops"
      environment = "dev"
   }
}

variable "application_port" {
   description = "Port that you want to expose to the external load balancer"
   default     = 80
}

variable "admin_username" {
  default = "spirt"
}

variable "secret_names" {
  type = list(string)
  default = [
    "secret1",
    "secret2"
  ]
}

variable "keys" {
  type = list(string)
  default = [
    "generated-certificate1",
    "generated-certificate2"
  ]
}
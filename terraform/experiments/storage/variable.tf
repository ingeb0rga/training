variable "location" {
  default = "westeurope"
}

variable "CLIENT_SECRET" {
  type = string
}

variable "resource_group" {
  default = "terraform"
}

variable "nsg" {
  default = "terraform"
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

variable "storage_container_name" {
  default = [
    "terraform",
    "terraform2"
  ]
}
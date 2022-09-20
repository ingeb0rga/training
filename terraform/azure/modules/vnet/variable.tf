variable "vnet_cidr" {
  default = "192.168.0.0/16"
}

variable "vnet_name" {
  default = "vnet_test"
}

# variable "subnet_name_prefix" {
#   default = "subnet"
# }

variable "subnet_list" {
  type = list(object({
   cidr = string
   name = string
  }))
}

variable "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   type        = map(string)
   default = {
      owner       = "devops"
      environment = "dev"
   }
}
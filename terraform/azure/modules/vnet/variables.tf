variable "vnet_cidr" {
  default = "192.168.0.0/16"
}

variable "vnet_name" {
  default = "vnet_test"
}

variable "location" {}

variable "rg_name" {}

variable "subnet_list" {
  default = [
    {
      cidr = "192.168.1.0/24"
      name = "subnet1"
    },
    {
      cidr = "192.168.2.0/24"
      name = "subnet2"
    }
  ]  
}

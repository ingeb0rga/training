variable "location" {}

variable "rg_name" {}

variable "vnet" {}

variable "subnet_id" {}

variable "application_port" {
   description = "Port that you want to expose to the external load balancer"
   default     = 80
}

variable "admin_username" {
  default = "spirt"
}

variable "nsg_id" {}

variable "sku" {
  default = "Standard_B1ls"
}

variable "storage_account_type" {
  default = "Standard_LRS"
}

variable "loadbalancer_name" {
  default = "vmss-lb"
}

variable "vm_scale_set" {
  default = "testvmscaleset"
}

variable "instance_count" {
  type = number
  default = 3
}
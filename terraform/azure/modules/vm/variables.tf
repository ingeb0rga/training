variable "location" {}

variable "rg_name" {}

variable "vnet" {}

variable "subnet_id" {}

variable "nsg_id" {}

variable "tags" {}

variable "vm_name" {
  default = "terraformvm"
}

variable "vm_size" {
  default = "Standard_B1ls"
}

variable "admin_username" {
  default = "spirt"
}

variable "storage_account_type" {
  default = "Standard_LRS"
}

# variable "public_ip_name" {
#   default = "devops-terraformvmPublicIP"
# }

# variable "nic_name" {
#   default = "devops-nic"
# }
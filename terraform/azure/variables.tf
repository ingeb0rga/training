variable "CLIENT_SECRET" {
  default = ""
}

variable "location" {
  default = "westeurope"
}

variable "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   default = {
      owner       = "devops"
      environment = "dev"
   }
}
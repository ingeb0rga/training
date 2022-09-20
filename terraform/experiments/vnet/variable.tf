variable "CLIENT_SECRET" {}

variable "resource_group" {
  default = "terraform"
}

variable "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   type        = map(string)
   default = {
      owner       = "devops"
      environment = "dev"
   }
}
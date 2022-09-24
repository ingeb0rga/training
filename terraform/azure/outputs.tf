output "CLIENT_SECRET" {
  value = ""
}

output "location" {
  value = "westeurope"
}

output "tags" {
   description = "Map of the tags to use for the resources that are deployed"
   value = {
      owner = "devops"
      env   = "dev"
   }
}
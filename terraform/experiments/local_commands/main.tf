provider "azurerm" {
  features {}
}

# resource "null_resource" "command1" {
#   provisioner "local-exec" {
#     command = "echo Terraform start at $(date) >> log.txt"
#   }
# }

# resource "null_resource" "command2" {
#   provisioner "local-exec" {
#     command = "print('Hello World!')"
#     interpreter = [
#       "python",
#       "-c"
#     ]
#   }
# }

# resource "null_resource" "command3" {
#   provisioner "local-exec" {
#     command = "ping -c 5 8.8.8.8"
#   }
# }


resource "random_password" "pass_gen" {
  count = length(var.secret_names)
  length = 12
  special = true
}

variable "secret_names" {
  type = list(string)
  default = [
    "secret1",
    "secret2"
  ]
}

output "secrets1" {
  sensitive = true
  value = random_password.pass_gen[0].result
}

output "secrets2" {
  sensitive = true
  value = random_password.pass_gen[1].result
}
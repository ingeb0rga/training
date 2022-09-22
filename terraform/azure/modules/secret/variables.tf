variable "secret_names" {
  type = list(string)
  default = [
    "secret1",
    "secret2"
  ]
}

variable "secret_length" {
  type = number
  default = 12
}

variable "key_vault_id" {}
variable "keys" {
  type = list(string)
  default = [
    "ssh-key1",
    "ssh-key2"
  ]
}

variable "key_vault_id" {}
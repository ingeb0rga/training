#-------------------------------------

module "resourcegroup" {
  source = "./modules/resource_group"
  location = var.location
}

output "rg_name" {
  value = module.resourcegroup.rg_name
}

#-------------------------------------

module "vnet" {
  source = "./modules/vnet"
  location = var.location
  rg_name = module.resourcegroup.rg_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "subnet_list" {
  # value = tostring(tolist([for obj in module.vnet.subnet_list : obj.id])[0])
  # value = module.vnet.subnet_list
  value = module.vnet.subnets
}

output "subnet_id" {
  value = module.vnet.subnet_id
}

#-------------------------------------

module "nsg" {
  source = "./modules/nsg"
  location = var.location
  rg_name = module.resourcegroup.rg_name
}

output "nsg_id" {
  value = module.nsg.nsg_id
}

#-------------------------------------

# module "storage_account" {
#   source = "./modules/storage_account"
#   location = var.location
#   rg_name = module.resourcegroup.rg_name  
# }

# output "storage_account_name" {
#   value = module.storage_account.storage_account_name
# }

#-------------------------------------

# module "storage_container" {
#   source = "./modules/storage_container"
#   storage_account = module.storage_account.storage_account_name
# }

# output "containers_list" {
#   value = module.storage_container.container_name
# }

#-------------------------------------

# module "keyvault" {
#   source = "./modules/keyvault"
#   location = var.location
#   rg_name = module.resourcegroup.rg_name 
# }

# output "key_vault_id" {
#   value = module.keyvault.key_vault_id
# }

#-------------------------------------

# module "secret" {
#   source = "./modules/secret"
#   key_vault_id = module.keyvault.key_vault_id
# }

# output "secrets" {
#   value = module.secret.secrets
# }

#-------------------------------------

# module "ssh_key" {
#   source = "./modules/ssh_key"
#   key_vault_id = module.keyvault.key_vault_id
# }

# output "ssh_keys" {
#   value = module.ssh_key.keys
# }

#-------------------------------------

module "vm1" {
  source      = "./modules/vm"
  location    = var.location
  vm_name     = "terraformvm1"
  rg_name     = module.resourcegroup.rg_name
  vnet        = module.vnet.vnet_name
  subnet_id   = module.vnet.subnet_id
  nsg_id      = module.nsg.nsg_id
  tags        = var.tags
}

output "public_ip1" {
  value = module.vm1.public_ip
}

module "vm2" {
  source      = "./modules/vm"
  location    = var.location
  vm_name     = "terraformvm2"
  rg_name     = module.resourcegroup.rg_name
  vnet        = module.vnet.vnet_name
  subnet_id   = module.vnet.subnet_id
  nsg_id      = module.nsg.nsg_id
  tags        = {
    owner = "devops"
    env   = "stag"
  }
}

output "public_ip2" {
  value = module.vm2.public_ip
}

module "vm3" {
  source      = "./modules/vm"
  location    = var.location
  vm_name     = "terraformvm3"
  rg_name     = module.resourcegroup.rg_name
  vnet        = module.vnet.vnet_name
  subnet_id   = module.vnet.subnet_id
  nsg_id      = module.nsg.nsg_id
  tags        = {
    owner = "devops"
    env   = "prod"
  }  
}

output "public_ip3" {
  value = module.vm3.public_ip
}

#-------------------------------------

# module "vmss" {
#   source      = "./modules/vmss_lb"
#   location    = var.location
#   rg_name     = module.resourcegroup.rg_name
#   vnet        = module.vnet.vnet_name
#   subnet_id   = module.vnet.subnet_id
#   nsg_id      = module.nsg.nsg_id
# }

# output "vmss_public_ip" {
#   value = module.vmss.vmss_public_ip
# }

#-------------------------------------
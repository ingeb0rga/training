provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.CLIENT_SECRET
  tenant_id       = var.tenant_id
}

# locals {
#   for_each = ["terraformvm1", "terraformvm2"]
#   vmname = {
#     value = each.value
#   }
# }

data "azurerm_subnet" "devops" {
  name = "subnet1"
  resource_group_name = var.azurerm_resource_group
  virtual_network_name = var.azurerm_virtual_network
}

resource "azurerm_network_security_group" "devops" {
  name = "devops-terraform"
  resource_group_name = var.azurerm_resource_group
  location = var.location

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
}

resource "azurerm_public_ip" "devops" {
  name                = "devops-terraformvmPublicIP"
  resource_group_name = var.azurerm_resource_group
  location            = var.location
  allocation_method   = "Static"  
}

resource "azurerm_network_interface" "devops" {
  name                = "devops-nic"
  resource_group_name = var.azurerm_resource_group
  location = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.devops.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devops.id
  }
}

resource "azurerm_network_interface_security_group_association" "devops" {
  network_interface_id      = azurerm_network_interface.devops.id
  network_security_group_id = azurerm_network_security_group.devops.id
}

resource "azurerm_linux_virtual_machine" "devops" {
  # for_each            = toset(local.vmname)
  name                = "terraform-vm"
  location            = var.location
  resource_group_name = var.azurerm_resource_group
  size                = "Standard_B1ls"
  admin_username      = "spirt"
  admin_ssh_key {
    username    = "spirt"
    public_key  = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  # source_image_reference {
  # publisher = "OpenLogic"
  # offer     = "CentOS"
  # sku       = "7.5"
  # version   = "latest"
  # }

  source_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
  version   = "latest"
  }

  network_interface_ids = [azurerm_network_interface.devops.id]

  # custom_data = filebase64("customdata.tpl")
  custom_data = base64encode(templatefile("customdata3.tpl", 
  {
      f_name  = "devops",
      l_name  = "spirt",
      names   = ["Bob", "Dan", "Max"]
  }))

  lifecycle {
    # ignore_changes = [custom_data, source_image_reference]
    create_before_destroy = true
  }  
}

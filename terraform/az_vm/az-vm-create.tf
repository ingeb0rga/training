variable "location" {
  default = "westeurope"
}

variable "CLIENT_SECRET" {
  type = string
}

variable "azurerm_resource_group" {
  default = "devops-rg"
}

variable "azurerm_virtual_network" {
  default = "devops-vnet"
}

data "azurerm_network_security_group" "devops" {
  name = "devops-vm2NSG"
  resource_group_name = var.azurerm_resource_group
}

data "azurerm_subnet" "devops" {
  name = "subnet1"
  resource_group_name = var.azurerm_resource_group
  virtual_network_name = var.azurerm_virtual_network
}

provider "azurerm" {
  features {}
  subscription_id = "f1991654-3b2e-45ef-8814-9c357a7e88c6"
  client_id       = "af90d886-bfe0-4910-bfab-5c13f93d7942"
  client_secret   = var.CLIENT_SECRET
  tenant_id       = "2b38acf2-0a98-49af-a8a5-450b81fc916a"
}

resource "azurerm_public_ip" "devops" {
  name                = "devops-terraformvmPublicIP"
  resource_group_name = var.azurerm_resource_group
  location            = var.location
  allocation_method   = "Dynamic"  
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
  network_security_group_id = data.azurerm_network_security_group.devops.id
}

# data "azurerm_network_interface" "devops" {
#   name                = "devops-nic"
#   resource_group_name = data.azurerm_resource_group.devops.name
# }

resource "azurerm_linux_virtual_machine" "terraform" {
  name                = "terraformvm"
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
  
}
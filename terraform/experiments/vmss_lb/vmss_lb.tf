provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.CLIENT_SECRET
  tenant_id       = var.tenant_id
}

# resource "azurerm_resource_group" "devops" {
#   name     = "example-resources"
#   location = var.location
# }

# resource "azurerm_virtual_network" "devops" {
#   name                = "example-network"
#   resource_group_name = azurerm_resource_group.devops.name
#   location            = var.location
#   address_space       = ["192.168.0.0/16"]
# }

data "azurerm_subnet" "devops" {
  name                  = "subnet1"
  resource_group_name   = var.azurerm_resource_group
  virtual_network_name  = var.azurerm_virtual_network
  # address_prefixes      = ["192.168.1.0/24"]
}

resource "azurerm_network_security_group" "devops" {
  name                = "devops-terraform"
  resource_group_name = var.azurerm_resource_group
  location            = var.location

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

  tags = var.tags
}

resource "azurerm_public_ip" "lb" {
  name                = "devops-terraform-lb-PublicIP"
  resource_group_name = var.azurerm_resource_group
  location            = var.location
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "devops" {
  name                = "devops-terraform-PublicIP"
  resource_group_name = var.azurerm_resource_group
  location            = var.location
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_network_interface" "devops" {
  name                = "devops-nic"
  resource_group_name = var.azurerm_resource_group
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.devops.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devops.id
  }
  
  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "devops" {
  network_interface_id      = azurerm_network_interface.devops.id
  network_security_group_id = azurerm_network_security_group.devops.id
}

resource "azurerm_linux_virtual_machine" "devops" {
  name                = "terraformvm"
  location            = var.location
  resource_group_name = var.azurerm_resource_group
  size                = "Standard_B1ls"
  admin_username      = var.admin_username
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

  lifecycle {
    ignore_changes = [custom_data, source_image_reference]
  }

  tags = merge(var.tags, {VM_location = var.location})
}

resource "azurerm_lb" "devops" {
  name                = "vmss-lb"
  location            = var.location
  resource_group_name = var.azurerm_resource_group

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb.id
 }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "devops" {
  loadbalancer_id = azurerm_lb.devops.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "devops" {
  loadbalancer_id = azurerm_lb.devops.id
  name            = "ssh-running-probe"
  port            = var.application_port
}

resource "azurerm_lb_rule" "lbnatrule" {
  loadbalancer_id                = azurerm_lb.devops.id
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = var.application_port
  backend_port                   = var.application_port
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.devops.id]
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.devops.id
}

resource "azurerm_linux_virtual_machine_scale_set" "devops" {
  name                  = "vmscaleset"
  location              = var.location
  resource_group_name   = var.azurerm_resource_group
  sku                   = "Standard_B1ls"
  instances             = 3
  admin_username        = var.admin_username
  
  admin_ssh_key {
    username    = "spirt"
    public_key  = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching               = "ReadWrite"
    storage_account_type  = "Standard_LRS"
  }

  network_interface {
    name    = "terraformnetworkprofile"
    primary = true

    ip_configuration {
      name                                    = "IPConfiguration"
      subnet_id                               = data.azurerm_subnet.devops.id
      load_balancer_backend_address_pool_ids  = [azurerm_lb_backend_address_pool.devops.id]
      primary                                 = true
    }
  }

  custom_data = base64encode(templatefile("customdata3.tpl", 
  {
      f_name  = "devops",
      l_name  = "spirt",
      names   = ["Bob", "Dan", "Max"]
  }))
  
  tags = var.tags
}

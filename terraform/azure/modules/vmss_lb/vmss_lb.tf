resource "azurerm_public_ip" "lb" {
  name                = "devops-terraform-lb-PublicIP"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"

  # tags = var.tags
}

resource "azurerm_lb" "devops" {
  name                = var.loadbalancer_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb.id
 }

  # tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "devops" {
  loadbalancer_id = azurerm_lb.devops.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "devops" {
  loadbalancer_id = azurerm_lb.devops.id
  name            = "ssh-running-probe"
  port            = 22
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
  name                  = var.vm_scale_set
  location              = var.location
  resource_group_name   = var.rg_name
  sku                   = var.sku
  instances             = var.instance_count
  admin_username        = var.admin_username
  
  admin_ssh_key {
    username    = var.admin_username
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
    storage_account_type  = var.storage_account_type
  }

  network_interface {
    name    = "test_networkprofile"
    primary = true

    ip_configuration {
      name                                    = "IPConfiguration"
      subnet_id                               = var.subnet_id
      load_balancer_backend_address_pool_ids  = [azurerm_lb_backend_address_pool.devops.id]
      primary                                 = true
    }
  }

  custom_data = base64encode(templatefile("./modules/vmss_lb/customdata3.tpl", 
  {
      f_name  = "devops",
      l_name  = "spirt",
      names   = ["Bob", "Dan", "Max"]
  }))
  
  # tags = var.tags
}

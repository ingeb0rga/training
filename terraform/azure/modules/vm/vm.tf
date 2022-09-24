resource "azurerm_public_ip" "devops" {
  # name                = var.public_ip_name
  name                = "pub_ip_${var.vm_name}"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"  
}

resource "azurerm_network_interface" "devops" {
  # name                = var.nic_name
  name                = "nic-${var.vm_name}"
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devops.id
  }

  depends_on = [
    azurerm_public_ip.devops
  ]
}

resource "azurerm_network_interface_security_group_association" "devops" {
  network_interface_id      = azurerm_network_interface.devops.id
  network_security_group_id = var.nsg_id

  depends_on = [
    azurerm_network_interface.devops
  ]
}

resource "azurerm_linux_virtual_machine" "terraform" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.rg_name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_ssh_key {
    username    = var.admin_username
    public_key  = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
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
  # custom_data = base64encode(templatefile("./customdata3.tpl", 
  # {
  #     f_name  = "devops",
  #     l_name  = "spirt",
  #     names   = ["Bob", "Dan", "Max"]
  # }))

  tags = var.tags

  depends_on = [
    azurerm_network_interface_security_group_association.devops
  ]
}
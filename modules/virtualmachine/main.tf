# VM 1
resource "azurerm_linux_virtual_machine" "virtualmachine1" {
  depends_on          = [var.resourcename]
  name                = "${var.prefix}-vmmaster"
  resource_group_name = var.environmentname
  location            = var.environmentlocation
  size                = "Standard_B2s"
  admin_username      = var.vm_username1
  admin_password      = var.vm_password
  network_interface_ids = [var.networkinterface1]
  disable_password_authentication = "false"
  

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~publickey.pub")
  # }

  os_disk {
    name                 = "${var.prefix}-disk-1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

# VM 2
resource "azurerm_linux_virtual_machine" "virtualmachine2" {
  depends_on          = [azurerm_linux_virtual_machine.virtualmachine1]
  name                = "${var.prefix}-vm-worker"
  resource_group_name = var.environmentname
  location            = var.environmentlocation
  size                = "Standard_B2s"
  admin_username      = var.vm_username2
  admin_password      = var.vm_password
  network_interface_ids = [var.networkinterface2]
  disable_password_authentication = "false"
  # dns_name = "Master"
  # public_ip_addresses    = 

  # admin_ssh_key {
  #   username   = "adminuser2"
  #   public_key = file("/home/mevirtual/.ssh/id_rsa.pub")
  # }

  os_disk {
    name                 = "${var.prefix}-disk-2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

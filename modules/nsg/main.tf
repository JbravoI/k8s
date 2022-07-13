# Create Security Group to access linux
resource "azurerm_network_security_group" "vm-nsg" {
  depends_on=[var.resourcename]
  name                = "${var.prefix}-nsg"
  location            = var.environmentlocation
  resource_group_name = var.environmentname
  
  security_rule {
    name                       = "AllowHTTP"
    description                = "Allow HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "AllowSSH"
    description                = "Allow SSH"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowRDP"
    description                = "Allow RDP"
    priority                   = 170
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.ports
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
}
# Associate the NSG with the subnet1
resource "azurerm_subnet_network_security_group_association" "nsgassociation1" {
  depends_on=[var.resourcename]
  subnet_id                 = var.subnetid1
  network_security_group_id = azurerm_network_security_group.vm-nsg.id
}


# Associate the NSG with the subnet2
resource "azurerm_subnet_network_security_group_association" "nsgassociation1" {
  depends_on=[var.resourcename]
  subnet_id                 = var.subnetid2
  network_security_group_id = azurerm_network_security_group.vm-nsg.id
}

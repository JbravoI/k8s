output "vnetid" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet1id" {
  value = azurerm_subnet.subnet1.id
}

output "subnet2id" {
  value = azurerm_subnet.subnet2.id
}

output "networkinterface1" {
  value = azurerm_network_interface.networkinterface1.id
}

output "networkinterface2" {
  value = azurerm_network_interface.networkinterface2.id
}

output "publicip" {
  value = azurerm_public_ip.vmpublicip.id
}
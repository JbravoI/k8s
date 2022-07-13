# Resource Group
resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resource_group_name
  location = var.location
}

# "./modules/aks_network"
# Module to create Vnet
module "vnet" {
  source              = "./modules/networking"
  environmentlocation = var.location
  environmentname     = var.resource_group_name
  resourcename        = azurerm_resource_group.resourcegroup
}
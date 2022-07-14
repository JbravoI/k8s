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

# Module to create NSG
module "network-security-group" {
  source              = "./modules/nsg"
  environmentlocation = var.location
  environmentname     = var.resource_group_name
  subnetid1           = module.vnet.subnet1id
  subnetid2           = module.vnet.subnet2id
  resourcename        = module.vnet
}

# Module to Virtual Machine 1
module "vm_1" {
  source              = "./modules/virtualmachine"
  environmentlocation = var.location
  environmentname     = var.resource_group_name
  networkinterface1   = module.vnet.networkinterface1
  networkinterface2   = module.vnet.networkinterface2
  resourcename        = module.network-security-group.nsgrule
}

# Module to Virtual Machine 2
module "vm_2" {
  source              = "./modules/virtualmachine"
  environmentlocation = var.location
  environmentname     = var.resource_group_name
  networkinterface2   = module.vnet.networkinterface2
  networkinterface1   = module.vnet.networkinterface1
  resourcename        = module.vm_1
}
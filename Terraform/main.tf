## 
# Local variables
##

locals {
  vnet_name = "${var.naming_prefix}-${random_integer.name_suffix.result}-vnet"
  subnet_name = "${var.naming_prefix}-${random_integer.name_suffix.result}-snet"
}

resource "random_integer" "name_suffix" {
  min = 1000
  max = 9999
}

# Create Virtual Network and enabled DDOS protection
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  address_space       = ["10.20.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group  
}
 
# Create Subnet within virtual network
resource "azurerm_subnet" "subnet" {
  name                 = local.subnet_name
  resource_group_name  = var.resource_group  
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.20.0.0/24"]
}
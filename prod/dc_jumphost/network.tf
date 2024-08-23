### Jump Host VNET 01
resource "azurerm_virtual_network" "Jump01" {
  name                = "VNET-JumpHost_01"
  address_space       = ["10.0.20.0/24"]
  location            = azurerm_resource_group.RG-JumpHosts.location
  resource_group_name = azurerm_resource_group.RG-JumpHosts.name
}

### Subnets for VNET-HubDomainController01
resource "azurerm_subnet" "Jump01_01" {
  name                 = "SUBNET-Jump01_01"
  resource_group_name  = azurerm_resource_group.RG-JumpHosts.name
  virtual_network_name = azurerm_virtual_network.Jump01.name
  address_prefixes     = ["10.0.20.0/28"]
}

resource "azurerm_subnet" "Jump01_02" {
  name                 = "SUBNET-Jump01_02"
  resource_group_name  = azurerm_resource_group.RG-JumpHosts.name
  virtual_network_name = azurerm_virtual_network.Jump01.name
  address_prefixes     = ["10.0.20.16/28"]
}

resource "azurerm_public_ip" "SRVJUMP01" {
  name                = "PIP-SRVJUM01"
  resource_group_name = azurerm_resource_group.RG-JumpHosts.name
  location            = azurerm_resource_group.RG-JumpHosts.location
  allocation_method   = "Static"
}
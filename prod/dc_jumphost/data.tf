data "azurerm_virtual_network" "VNET-HubDC01" {
  name                = "VNET-HubDC01"
  resource_group_name = "RG-DomainNetwork"
}

data "azurerm_resource_group" "RG-DomainNetwork" {
  name = "RG-DomainNetwork"
}
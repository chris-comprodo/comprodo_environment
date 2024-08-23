### Hub VNET for domain controller
resource "azurerm_virtual_network" "Hub01" {
  name                = "VNET-HubDC01"
  address_space       = ["10.0.10.0/24"]
  location            = azurerm_resource_group.RG-DomainNetwork.location
  resource_group_name = azurerm_resource_group.RG-DomainNetwork.name
}

### Subnets for VNET-HubDomainController01
resource "azurerm_subnet" "IntDC01" {
  name                 = "SUBNET-IntDC01"
  resource_group_name  = azurerm_resource_group.RG-DomainNetwork.name
  virtual_network_name = azurerm_virtual_network.Hub01.name
  address_prefixes     = ["10.0.10.0/28"]
}

resource "azurerm_subnet" "IntDC02" {
  name                 = "SUBNET-IntDC02"
  resource_group_name  = azurerm_resource_group.RG-DomainNetwork.name
  virtual_network_name = azurerm_virtual_network.Hub01.name
  address_prefixes     = ["10.0.10.16/28"]
}
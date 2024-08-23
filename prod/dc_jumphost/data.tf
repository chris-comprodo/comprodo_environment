data "azurerm_virtual_network" "Hub01" {
  name                = "VNET-HubDC01"
  resource_group_name = "RG-DomainNetwork"
}
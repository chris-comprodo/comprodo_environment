resource "azurerm_virtual_network_peering" "Jump01-to-Hub01" {
  name                      = "VNETPEER-Jump01_to_Hub01"
  resource_group_name       = azurerm_resource_group.RG-JumpHosts.name
  virtual_network_name      = azurerm_virtual_network.Jump01.name
  remote_virtual_network_id = data.azurerm_virtual_network.VNET-HubDC01.id
}

resource "azurerm_virtual_network_peering" "Hub01-to-Jump01" {
  name                      = "VNETPEER-Hub01_to_Jump01"
  resource_group_name       = data.azurerm_resource_group.RG-DomainNetwork.name
  virtual_network_name      = data.azurerm_virtual_network.VNET-HubDC01.name
  remote_virtual_network_id = azurerm_virtual_network.Jump01.id
}
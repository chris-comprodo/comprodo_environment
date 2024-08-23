resource "azurerm_network_security_group" "SRVDC01" {
  name                = "NSG-SRVDC01"
  location            = azurerm_resource_group.RG-DomainController.location
  resource_group_name = azurerm_resource_group.RG-DomainController.name

  security_rule {
    name                       = "BlockInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
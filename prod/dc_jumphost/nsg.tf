resource "azurerm_network_security_group" "SRVJUMP01" {
  name                = "NSG-SRVJUMP01"
  location            = azurerm_resource_group.RG-JumpHosts.location
  resource_group_name = azurerm_resource_group.RG-JumpHosts.name

  security_rule {
    name                       = "AllowInboundRDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
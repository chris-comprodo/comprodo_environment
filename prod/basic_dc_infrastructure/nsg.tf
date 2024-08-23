resource "azurerm_network_security_group" "SRVDC01" {
  name                = "NSG-SRVDC01"
  location            = azurerm_resource_group.RG-DomainController.location
  resource_group_name = azurerm_resource_group.RG-DomainController.name

  security_rule {
    name                       = "BlockInbound"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "Allow_Jump01_RDP"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }
}
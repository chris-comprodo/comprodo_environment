resource "azurerm_network_security_group" "nsg_priv-sec_high" {
  name                = "NSG-Default_Piv_Sec_High"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name

  security_rule {
    name                       = "BlockAllInbound"
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
    name                       = "BlockAllOutbound"
    priority                   = 501
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "nsg_priv_sec_med" {
  name                = "NSG-Default_Piv_Sec_Medium"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name

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
}


resource "azurerm_network_security_group" "nsg_sub_priv_ad_01_01" {
  name                = "NSG-Sub_Priv_AD_01_01"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name

  security_rule {
    name                       = "BlockAllInbound"
    priority                   = 899
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "BlockAllOutbound"
    priority                   = 898
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "nsg_sub_priv_ad_01_02" {
  name                = "NSG-Sub_Priv_AD_01_02"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name

  security_rule {
    name                       = "BlockAllInbound"
    priority                   = 899
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "BlockAllOutbound"
    priority                   = 898
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "nsg_sub_priv_ad_01_03" {
  name                = "NSG-Sub_Priv_AD_01_03"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name

  security_rule {
    name                       = "BlockAllInbound"
    priority                   = 899
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "BlockAllOutbound"
    priority                   = 898
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
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
resource "azurerm_network_security_group" "nsg_sub_pub_app_01_01" {
  name                = "NSG-Sub_Pub_App_01_01"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name

    security_rule {
    name                       = "AllowSSHInbound"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
      security_rule {
    name                       = "AllowCalderaHttpInbound"
    priority                   = 151
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8888"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
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
}
resource "azurerm_network_security_group" "nsg_sub_priv_siem_01_01" {
  name                = "NSG-Sub_Priv_SIEM_01_01"
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
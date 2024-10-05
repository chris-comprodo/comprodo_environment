### Active Directory Network 01 ###
resource "azurerm_virtual_network" "vnet_ad_01" {
  name                = "VNET-Priv_AD_01"
  address_space       = ["10.0.10.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name
  tags = {
    Security_Zone = "Sec_Int_Private_High"
  }
}

# Subnets
resource "azurerm_subnet" "sub_ad_01_01" {
  name                 = "SUBNET-Priv_AD_01_01"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet_ad_01.name
  address_prefixes     = ["10.0.10.0/28"]
}
resource "azurerm_subnet_network_security_group_association" "nsgjoin_sub_ad_01_01" {
  subnet_id                 = azurerm_subnet.sub_ad_01_01.id
  network_security_group_id = azurerm_network_security_group.nsg_sub_priv_ad_01_01.id
}

resource "azurerm_subnet" "sub_ad_01_02" {
  name                 = "SUBNET-Priv_AD_01_02"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet_ad_01.name
  address_prefixes     = ["10.0.10.16/28"]
}
resource "azurerm_subnet_network_security_group_association" "nsgjoin_sub_ad_01_02" {
  subnet_id                 = azurerm_subnet.sub_ad_01_02.id
  network_security_group_id = azurerm_network_security_group.nsg_sub_priv_ad_01_02.id
}

resource "azurerm_subnet" "sub_ad_01_03" {
  name                 = "SUBNET-Priv_AD_01_03"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet_ad_01.name
  address_prefixes     = ["10.0.10.32/28"]
}
resource "azurerm_subnet_network_security_group_association" "nsgjoin_sub_ad_01_03" {
  subnet_id                 = azurerm_subnet.sub_ad_01_03.id
  network_security_group_id = azurerm_network_security_group.nsg_sub_priv_ad_01_03.id
}


### Application Network Public 01 ###
# Direct inbound internet access allowed
resource "azurerm_virtual_network" "vnet_pub_app_01" {
  name                = "VNET-Pub_App_01"
  address_space       = ["10.0.30.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name
  tags = {
    Security_Zone = "Sec_Ext_Public_Low"
  }
}
resource "azurerm_subnet" "sub_pub_app_01_01" {
  name                 = "SUBNET-Pub_App_01_01"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet_pub_app_01.name
  address_prefixes     = ["10.0.30.0/28"]
}
resource "azurerm_subnet_network_security_group_association" "nsgjoin_sub_app_01_01" {
  subnet_id                 = azurerm_subnet.sub_pub_app_01_01.id
  network_security_group_id = azurerm_network_security_group.nsg_sub_pub_app_01_01.id
}

### Application Network Private 01 ###
# Non direct intrnet facing applications
resource "azurerm_virtual_network" "vnet_priv_app_01" {
  name                = "VNET-Priv_App_01"
  address_space       = ["10.0.31.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name
  tags = {
    Security_Zone = "Sec_Int_Private_Medium"
  }
}

### Gateway Network 01 ###
# Network for Application Gateways
resource "azurerm_virtual_network" "vnet_gateway_01" {
  name                = "VNET-Pub_Gateway_01"
  address_space       = ["10.0.32.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name
  tags = {
    Security_Zone = "Sec_Int_Public_Medium"
  }
}
### SIEM Private 01 ###
# Network for security monitoring and SIEM solutions
# Network for Microsoft Sentinel
resource "azurerm_virtual_network" "vnet_priv_siem_01" {
  name                = "VNET-Priv_SIEM_01"
  address_space       = ["10.0.33.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_network.name
  tags = {
    Security_Zone = "Sec_Int_Private_High"
  }
}
resource "azurerm_subnet" "sub_priv_siem_01_01" {
  name                 = "SUBNET-Priv_SIEM_01_01"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet_priv_siem_01.name
  address_prefixes     = ["10.0.33.0/28"]
}
resource "azurerm_subnet_network_security_group_association" "nsgjoin_sub_siem_01_01" {
  subnet_id                 = azurerm_subnet.sub_priv_siem_01_01.id
  network_security_group_id = azurerm_network_security_group.nsg_sub_priv_siem_01_01.id
}
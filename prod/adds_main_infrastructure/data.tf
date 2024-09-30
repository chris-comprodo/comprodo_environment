data "azurerm_virtual_network" "vnet_ad_01" {
  name                = "VNET-Priv_AD_01"
  resource_group_name = var.rg-network
}

data "azurerm_subnet" "sub_ad_01_01" {
    virtual_network_name = "VNET-Priv_AD_01"
    name                 = "SUBNET-Priv_AD_01_01"
    resource_group_name  = var.rg-network
}
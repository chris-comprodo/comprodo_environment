data "azurerm_virtual_network" "vnet_siem_01" {
  name                = "VNET-Priv_SIEM_01"
  resource_group_name = var.rg-network
}

data "azurerm_subnet" "sub_siem_01_01" {
    virtual_network_name = "VNET-Priv_SIEM_01"
    name                 = "SUBNET-Priv_SIEM_01_01"
    resource_group_name  = var.rg-network
}
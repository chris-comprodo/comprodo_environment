### Hub VNET for basic/core srevices
resource "azurerm_virtual_network" "Hub01" {
  name                = "VNET-HubNetwork01"
  address_space       = ["10.0.20.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.RG-Main.name
}

### Spoke VNET for AVD Host Secure Low
resource "azurerm_virtual_network" "Spoke01" {
  name                = "VNET-SpokeAVDHostLow"
  address_space       = ["10.0.21.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.RG-Main.name
}

### Spoke VNET for AVD Host Secure Medium
resource "azurerm_virtual_network" "Spoke02" {
  name                = "VNET-SpokeAVDHostMid"
  address_space       = ["10.0.22.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.RG-Main.name
}

### Spoke VNET for AVD Host Secure High
resource "azurerm_virtual_network" "Spoke03" {
  name                = "VNET-SpokeAVDHostHigh"
  address_space       = ["10.0.23.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.RG-Main.name
}

### Spoke VNET for Azure resources Secure Medium
resource "azurerm_virtual_network" "Spoke04" {
  name                = "VNET-SpokeAVDAzureMid"
  address_space       = ["10.0.24.0/24"]
  location            = var.region
  resource_group_name = azurerm_resource_group.RG-Main.name
}


### Subnets for VNET-HubDomainController01
resource "azurerm_subnet" "Sub01" {
  name                 = "SUBNET-SpokeAVDHostLow-Sub01"
  resource_group_name  = azurerm_resource_group.RG-Main.name
  virtual_network_name = azurerm_virtual_network.Spoke01.name
  address_prefixes     = ["10.0.24.0/28"]
}

resource "azurerm_subnet" "Sub02" {
  name                 = "SUBNET-SpokeAVDHostLow-Sub02"
  resource_group_name  = azurerm_resource_group.RG-Main.name
  virtual_network_name = azurerm_virtual_network.Spoke01.anme
  address_prefixes     = ["10.0.24.16/28"]
}
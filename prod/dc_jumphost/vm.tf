### Virtual Machine - Windows Server 2022 - Jump Host
resource "azurerm_windows_virtual_machine" "SRVJUMP01" {
  name                = "VM-SRVJUMP01"
  computer_name       = "SRVJUMP01"
  resource_group_name = azurerm_resource_group.RG-JumpHosts.name
  location            = azurerm_resource_group.RG-JumpHosts.location
  size                = var.defaultWinServerVMSize
  hotpatching_enabled = false
  patch_mode          = "Manual"
  enable_automatic_updates = false
  admin_username      = "adminuser"
  admin_password      = "My#Demo12345CT"
  network_interface_ids = [
    azurerm_network_interface.SRVJUMP01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  tags = {
    Environment = "Prod"
  }
}

resource "azurerm_network_interface" "SRVJUMP01" {
  name                = "NIC-SRVJUMP01"
  location            = azurerm_resource_group.RG-JumpHosts.location
  resource_group_name = azurerm_resource_group.RG-JumpHosts.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Jump01_01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.SRVJUMP01.id
  }
}

resource "azurerm_network_interface_security_group_association" "SRVJUMP01" {
  network_interface_id      = azurerm_network_interface.SRVJUMP01.id
  network_security_group_id = azurerm_network_security_group.SRVJUMP01.id
}


# resource "azurerm_dev_test_global_vm_shutdown_schedule" "SRVJUMP01" {
#  virtual_machine_id = azurerm_windows_virtual_machine.SRVJUMP01.id
#  location = azurerm_resource_group.RG-JumpHosts.location
#  enabled = true
#  daily_recurrence_time = "1900"
#  timezone = "W. Europe Standard Time"
#  notification_settings {
#    enabled = true
#    email = "cthiemann@corp.comprodo.de"
#    time_in_minutes = "60"
#  }
# }
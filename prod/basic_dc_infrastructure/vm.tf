### Virtual Machine - Windows Domain Controller 01 - SRVDC01
resource "azurerm_windows_virtual_machine" "SRVDC01" {
  name                = "VM-SRVDC01"
  computer_name       = "SRVDC01"
  resource_group_name = azurerm_resource_group.RG-DomainController.name
  location            = azurerm_resource_group.RG-DomainController.location
  size                = var.defaultWinServerVMSize
  hotpatching_enabled = false
  patch_mode          = "Manual"
  admin_username      = "adminuser"
  admin_password      = "My#Demo12345CT"
  network_interface_ids = [
    azurerm_network_interface.SRVDC01.id,
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
}

resource "azurerm_network_interface" "SRVDC01" {
  name                = "NIC-SRVDC01"
  location            = azurerm_resource_group.RG-DomainController.location
  resource_group_name = azurerm_resource_group.RG-DomainController.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.IntDC01.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "SRVDC01" {
  network_interface_id      = azurerm_network_interface.SRVDC01.id
  network_security_group_id = azurerm_network_security_group.SRVDC01.id
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "SRVDC01" {
  virtual_machine_id = azurerm_windows_virtual_machine.SRVDC01.id
  location = azurerm_resource_group.RG-DomainController.location
  enabled = true
  daily_recurrence_time = "1900"
  timezone = "W. Europe Standard Time"
  notification_settings {
    enabled = true
    email = "cthiemann@corp.comprodo.de"
    time_in_minutes = "60"
  }
}
### Virtual Machine - Windows Domain Controller 01 - SRVDC01
resource "azurerm_windows_virtual_machine" "vm_srv_dc01" {
  name                = "VM-Win_SRV_DC01"
  computer_name       = "SRVDC01"
  resource_group_name = azurerm_resource_group.rg-domain_controller.name
  location            = var.region
  size                = var.defaultWinServerVMSize
  hotpatching_enabled = false
  patch_mode          = "Manual"
  enable_automatic_updates = false
  admin_username      = "adminuser"
  admin_password      = "My#Demo12345CT"
  network_interface_ids = [
    azurerm_network_interface.nic_srvdc01,
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

resource "azurerm_network_interface" "nic_srvdc01" {
  name                = "NIC-SRVDC01"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg-domain_controller.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sub_ad_01_01.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.10.4"

  }
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "SRVDC01" {
  virtual_machine_id = azurerm_windows_virtual_machine.vm_srv_dc01.id
  location = azurerm_resource_group.rg-domain_controller
  enabled = true
  daily_recurrence_time = "1900"
  timezone = "W. Europe Standard Time"
  notification_settings {
    enabled = true
    email = "cthiemann@corp.comprodo.de"
    time_in_minutes = "60"
  }
}
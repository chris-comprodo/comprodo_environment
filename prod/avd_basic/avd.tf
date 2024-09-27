### AVD workspace Sec Low ###
resource "azurerm_virtual_desktop_workspace" "Workspace01" {
  name                = "Workspace_SecLow_01"
  resource_group_name = azurerm_resource_group.RG-Main.name
  location            = var.region
  friendly_name       = "Workspace_SecLow_01"
  description         = "Workspace_SecLow_01"
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "hostreg01" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.Hostpool01
  expiration_date = "2025-01-01T04:00:00Z"
}

### Host Pool Sec Low 01 ###
resource "azurerm_virtual_desktop_host_pool" "Hostpool01" {
  location            = var.region
  resource_group_name = azurerm_resource_group.RG-Main.name
  name                     = "HostPool_SecLow_001"
  friendly_name            = "HostPool_SecLow_001"
  validate_environment     = false
  start_vm_on_connect      = false
  custom_rdp_properties    = "audiocapturemode:i:1;audiomode:i:0;"
  description              = "A personal host pool - Security Low"
  type                     = "Personal"
  public_network_access    = "Disabled"
  personal_desktop_assignment_type = "Direct"
  load_balancer_type       = "DepthFirst"
  scheduled_agent_updates {
    enabled = true
    schedule {
      day_of_week = "Saturday"
      hour_of_day = 2
    }
  }
}
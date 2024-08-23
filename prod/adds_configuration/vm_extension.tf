# Install Active Directory on the SRVDC01 VM
# Reference: https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-run-powershell-scripts-on-azure-vms-with-terraform/ba-p/3827573

resource "azurerm_virtual_machine_extension" "config_ad" {
  name                 = "config_ad"
  virtual_machine_id   = data.azurerm_virtual_machine.SRVDC01.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  protected_settings = <<SETTINGS
  {    
    "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.ADCONF.rendered)}')) | Out-File -filepath ADCONF.ps1\" && powershell -ExecutionPolicy Unrestricted -File ADCONF.ps1 -Domain_DNSName ${data.template_file.ADCONF.vars.Domain_DNSName} -Domain_NETBIOSName ${data.template_file.ADCONF.vars.Domain_NETBIOSName} -SafeModeAdministratorPassword ${data.template_file.ADCONF.vars.SafeModeAdministratorPassword}"
  }
  SETTINGS
}

#Variable input for the ADCONF.ps1 script
data "template_file" "ADCONF" {
    template = "${file("ADCONF.ps1")}"
    vars = {
        Domain_DNSName          = "${var.Domain_DNSName}"
        Domain_NETBIOSName      = "${var.netbios_name}"
        SafeModeAdministratorPassword = "${var.SafeModeAdministratorPassword}"
  }
}
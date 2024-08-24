# Version 2.0
# Automated Script
# Basic Variables
$BasicDomainPath = 'DC=corp,DC=comprodo,DC=de'
$AzureADDomain = '@corp.comprodo.de'

# Config Arrays
$Branches = ("SPRINGFIELD","SHELBYVILLE")
$OrgStructure = ("Applications","Departments","Devices","Groups")
# OU Applications
$Applications = ("SAP","MSOffice")
# OU Departments
$Departments = ("Police","Simpsons","Flanders","SpringfieldElementarySchool","KrustyBurger","MoesTavern","SpringfieldNuclearPowerPlant","SpringfieldRetirementCastle","KwikEMart")
$DepartmentStructure = ("Groups","ServiceAccounts","Users")
# OU Devices
$Devices = ("Servers","Desktops","ThinClients","MobileDevices","Laptops","Tablets")
$Servers = ("WinSrv","LnxSrv","WinSrvDB","LnxSrvDB","WinSrvApp","LnxSrvApp","WinSrvDC","WinSrvMail","WinSrvRDP","WinSrvPrint","WinSrvJump","LnySrvJump")
$Desktops = ("Windows10","Windows11","macOS")
$MobileDevices = ("iOS","Android","Windows")

### OU Structure
foreach ($Branche in $Branches) {
  New-ADOrganizationalUnit -Name $Branche -Path $BasicDomainPath -ProtectedFromAccidentalDeletion $false
  foreach ($Org in $OrgStructure) {
    New-ADOrganizationalUnit -Name $Org -Path "OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false 
    if ($Org -eq "Applications") {
      foreach ($App in $Applications) {
        New-ADOrganizationalUnit -Name $App -Path "OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
      }
    }
    elseif ($Org -eq "Departments") {
      foreach ($Dep in $Departments) {
        New-ADOrganizationalUnit -Name $Dep -Path "OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
          foreach ($DepStruct in $DepartmentStructure) {
            New-ADOrganizationalUnit -Name $DepStruct -Path "OU=$Dep,OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
        }
      }
    }
    elseif ($Org -eq "Devices") {
      foreach ($Dev in $Devices) {
        New-ADOrganizationalUnit -Name $Dev -Path "OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
        if ($Dev -eq "Servers") {
          foreach ($Server in $Servers) {
            New-ADOrganizationalUnit -Name $Server -Path "OU=$Dev,OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
        }
        }
        elseif ($Dev -eq "Desktops") {
            foreach ($Desktop in $Desktops) {
               New-ADOrganizationalUnit -Name $Desktop -Path "OU=$Dev,OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
          }
          }
        elseif ($Dev -eq "MobileDevices") {
          foreach ($MobDevice in $MobileDevices) {
             New-ADOrganizationalUnit -Name $Server -Path "OU=$Dev,OU=$Org,OU=$Branche,$BasicDomainPath" -ProtectedFromAccidentalDeletion $false
        }
        }
      }
    }
  }
}
### User Accounts ###
$initpassword = ConvertTo-SecureString -AsPlainText "My#Demo12345CT" -Force


$homer = @{
    Givenname = 'Homer'
    Surname = 'Simpson'
    SamAccountName = 'homer'
    DisplayName = 'Homer Simpson'
    UserPricipalName = 'homer@corp.comprodo.de'
    Country = 'US'
    City = 'Springfield'
    Company = 'Springfield Nuclear Power Plant'
    Department = 'Security'
    EmailAddress = 'homer@corp.comprodo.de'
    Path = 'OU=Users,OU=Simpsons,OU=Departemts,OU=SPRINGFIELD,DC=corp,DC=comprodo,DC=de'
    AccountPassword = $initpassword
    Enabled = $true
}
New-ADUser @homer

$bart = @{
    Givenname = 'Bart'
    Surname = 'Simpson'
    SamAccountName = 'bart'
    DisplayName = 'Bart Simpson'
    UserPricipalName = 'bart@corp.comprodo.de'
    Country = 'US'
    City = 'Springfield'
    EmailAddress = 'bart@corp.comprodo.de'
    Path = 'OU=Users,OU=Simpsons,OU=Departemts,OU=SPRINGFIELD,DC=corp,DC=comprodo,DC=de'
    AccountPassword = $initpassword
    Enabled = $true
}
New-ADUser @bart

$lisa = @{
    Givenname = 'Lisa'
    Surname = 'Simpson'
    SamAccountName = 'lisa'
    DisplayName = 'Lisa Simpson'
    UserPricipalName = 'lisa@corp.comprodo.de'
    Country = 'US'
    City = 'Springfield'
    EmailAddress = 'lisa@corp.comprodo.de'
    Path = 'OU=Users,OU=Simpsons,OU=Departemts,OU=SPRINGFIELD,DC=corp,DC=comprodo,DC=de'
    AccountPassword = $initpassword
    Enabled = $true
}
New-ADUser @lisa

$marge = @{
    Givenname = 'Marge'
    Surname = 'Simpson'
    SamAccountName = 'marge'
    DisplayName = 'Marge Simpson'
    UserPricipalName = 'marge@corp.comprodo.de'
    Country = 'US'
    City = 'Springfield'
    EmailAddress = 'marge@corp.comprodo.de'
    Path = 'OU=Users,OU=Simpsons,OU=Departemts,OU=SPRINGFIELD,DC=corp,DC=comprodo,DC=de'
    AccountPassword = $initpassword
    Enabled = $true
}
New-ADUser @marge

$maggie = @{
    Givenname = 'Maggie'
    Surname = 'Simpson'
    SamAccountName = 'maggie'
    DisplayName = 'Maggie Simpson'
    UserPricipalName = 'maggie@corp.comprodo.de'
    Country = 'US'
    City = 'Springfield'
    EmailAddress = 'bart@corp.comprodo.de'
    Path = 'OU=Users,OU=Simpsons,OU=Departemts,OU=SPRINGFIELD,DC=corp,DC=comprodo,DC=de'
    AccountPassword = $initpassword
    Enabled = $true
}
New-ADUser @bart
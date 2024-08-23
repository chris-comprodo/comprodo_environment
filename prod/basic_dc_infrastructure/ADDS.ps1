[CmdletBinding()]

param 
( 
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$Domain_DNSName,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [string]$Domain_NETBIOSName,
    [Parameter(ValuefromPipeline=$true,Mandatory=$true)] [String]$SafeModeAdministratorPassword
)

$SMAP = ConvertTo-SecureString -AsPlainText $SafeModeAdministratorPassword -Force

# Documentation: https://learn.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=windowsserver2022-ps
$ADParams = @{
    CreateDnsDelegation     = $false
    DatabasePath            = "C:\Windows\NTDS"
    DomainMode              = WinThreshold
    DomainName              = $Domain_DNSName
    DomainNetbiosName       = $Domain_NETBIOSName 
    ForestMode              = WinThreshold
    InstallDns              = $true
    LogPath                 = "C:\Windows\NTDS"
    NoRebootOnCompletion    = $false
    SysvolPath              = "C:\Windows\SYSVOL"
    Force                   = $true
    SkipPreChecks           = $true
    SafeModeAdministratorPassword = $SMAP
}

Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest @ADParams
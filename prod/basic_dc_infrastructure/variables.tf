### Environment variables for Comprodo ###
##########################################

variable "tenant" {
    type = string
    description = "Enter your Azure Tenant ID"
    #default = ""
}

variable "subscription" {
    type = string
    description = "Select your Azure Subscription"
    #default = ""
}

variable "region" {
    type = string
    description = "Select you main region for this deployment"
    default = "East US"
}

variable "defaultWinServerVMSize" {
    type = string
    default = "Standard_D2s_v3"
    description = "Default size for all Windows Server VMs"
}

### Microsoft AD DS variables for Comprodo ###
##########################################

variable "win_username" {
  description = "Windows node username"
  type        = string
  sensitive   = false
}

variable "win_userpass" {
  description = "Windows node password"
  type        = string
  sensitive   = true
}

variable "Domain_DNSName" {
  description = "FQDN for the Active Directory forest root domain"
  type        = string
  sensitive   = false
}

variable "netbios_name" {
  description = "NETBIOS name for the AD domain"
  type        = string
  sensitive   = false
}

variable "SafeModeAdministratorPassword" {
  description = "Password for AD Safe Mode recovery"
  type        = string
  sensitive   = true
}
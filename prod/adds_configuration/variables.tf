### Environment variables for Comprodo ###
##########################################

variable "tenant" {
    type = string
    description = "Enter your Azure Tenant ID"
    default = "b7961f3f-76b7-4ac9-bb80-beaab3f8514a"
}

variable "subscription" {
    type = string
    description = "Select your Azure Subscription"
    default = "23bd1606-4b10-4cc8-9ad8-72e798bb7fec"
}

variable "region" {
    type = string
    description = "Select you main region for this deployment"
    default = "East US"
}

### Microsoft AD DS variables for Comprodo ###
##########################################

variable "Domain_DNSName" {
  description = "FQDN for the Active Directory forest root domain"
  type        = string
  default     = "corp.comprodo.de"
  sensitive   = false
}

variable "netbios_name" {
  description = "NETBIOS name for the AD domain"
  type        = string
  default     = "corp"
  sensitive   = false
}

variable "SafeModeAdministratorPassword" {
  description = "Password for AD Safe Mode recovery"
  type        = string
  default     = "My!DisasterRecovery27283AD"
  sensitive   = true
}
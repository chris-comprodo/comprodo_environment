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

variable "prefix" {
type        = string
default     = "avdtf"
description = "Prefix of the name of the AVD machine(s)"
}

variable "defaultWinServerVMSize" {
    type = string
    default = "Standard_D2s_v3"
    description = "Default size for all Windows Server VMs"
}

variable "HostSizeS" {
  description = "Size of the AVD Host for Small"
  default     = "Standard_DS2_v2"
}

variable "win_username" {
  description = "Windows node username"
  type        = string
  sensitive   = false
  default = "adminuser"
}

variable "win_userpass" {
  description = "Windows node password"
  type        = string
  sensitive   = true
  default = "My#Demo12345CT"
}
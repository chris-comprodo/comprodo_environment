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
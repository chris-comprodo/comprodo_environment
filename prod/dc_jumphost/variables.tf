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

variable "defaultWinServerVMSize" {
    type = string
    default = "Standard_D2s_v3"
    description = "Default size for all Windows Server VMs"
}
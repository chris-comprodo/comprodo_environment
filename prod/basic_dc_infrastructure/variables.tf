### Environment variables for Comprodo
variable "subscription" {
    type = string
    #default = ""
}

variable "tenant" {
    type = string
    #default = ""
}

variable "defaultWinServerVMSize" {
    type = string
    default = "Standard_D2sv3"
    description = "Default size for all Windows Server VMs"
}
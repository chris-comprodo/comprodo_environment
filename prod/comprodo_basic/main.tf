# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = var.subscription
  tenant_id = var.tenant
}

resource "azurerm_resource_group" "rg_network" {
  name     = var.rg-network
  location = var.region
   tags = {
    Environment = "Prod"
  }
}
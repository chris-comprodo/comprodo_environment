# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
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

resource "azurerm_resource_group" "RG-DomainNetwork" {
  name     = "RG-DomainNetwork"
  location = "East US"
}

resource "azurerm_resource_group" "RG-DomainController" {
  name     = "RG-DomainController"
  location = "East US"
}
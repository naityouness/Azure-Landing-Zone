# Initialize Terraform with Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" 
    }
  }
  required_version = ">= 1.0.0"
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "LandingZoneRG"
  location = "East US" 
  tags = {
    environment = "LandingZone"
    owner       = "infinity"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

resource "azurerm_resource_group" "mystoragelab00001" {
  name     = "LandingZoneRG"
  location = "East US"
}

resource "azurerm_storage_account" "mystoragelab00001" {
  name                     = "mystoragelab00001" 
  resource_group_name      = "LandingZoneRG"
  location                 = "East US"
  account_tier             = "Standard"     
  account_replication_type = "LRS"          

  tags = {
    environment = "lab"
  }
}

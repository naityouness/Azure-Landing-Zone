provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  resource_group_name = "LandingZoneRG" # Resource group name should be in quotes
  location            = "East US"       # Replace with the actual location if needed
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "my-subnet"
  resource_group_name  = "LandingZoneRG"             # Resource group name in quotes
  virtual_network_name = azurerm_virtual_network.vnet.name # Reference the VNet name dynamically
  address_prefixes     = ["10.10.10.0/24"]
}

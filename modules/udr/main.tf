provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

# User-Defined Route Table
resource "azurerm_route_table" "udr" {
  name                = "LandingZoneUDR"
  resource_group_name = "LandingZoneRG" # Reference the existing resource group directly
  location            = "East US"       # Use the same location as the resource group

  tags = {
    environment = "lab"
  }
}

# Default Route to Azure Firewall
resource "azurerm_route" "default_route" {
  name                    = "default-to-internet"
  route_table_name        = azurerm_route_table.udr.name
  resource_group_name     = "LandingZoneRG" # Reference the existing resource group directly
  address_prefix          = "0.0.0.0/0"
  next_hop_type           = "VirtualAppliance"
  next_hop_in_ip_address  = "10.0.2.4" # Replace with your Azure Firewall private IP
}

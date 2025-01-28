provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "my-nsg"
  location            = "East US"
  resource_group_name = "LandingZoneRG"

  security_rule {
    name                       = "AllowHTTPS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "443"
    source_address_prefix     = "*"
    destination_address_prefix = "10.10.10.0/24"
  }

  security_rule {
    name                       = "DenyAll"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range         = "*"
    destination_port_range    = "*"
    source_address_prefix     = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = "/subscriptions/088b13f5-6629-4038-9bbf-4f95298fdf8f/resourceGroups/LandingZoneRG/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"
  network_security_group_id = azurerm_network_security_group.nsg.id
}

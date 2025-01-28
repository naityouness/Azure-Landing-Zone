provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

# Azure Firewall Subnet
resource "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = "LandingZoneRG"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.10.11.0/24"]
}

# Azure Firewall Management Subnet
resource "azurerm_subnet" "firewall_management_subnet" {
  name                 = "AzureFirewallManagementSubnet"
  resource_group_name  = "LandingZoneRG"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.10.12.0/24"]
}

# Public IP for Azure Firewall
resource "azurerm_public_ip" "firewall_public_ip" {
  name                = "FirewallPublicIP"
  resource_group_name = "LandingZoneRG"
  location            = "East US"
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "lab"
  }
}

# Management Public IP for Azure Firewall
resource "azurerm_public_ip" "firewall_management_public_ip" {
  name                = "FirewallManagementPublicIP"
  resource_group_name = "LandingZoneRG"
  location            = "East US"
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "lab"
  }
}

# Create the Azure Firewall
resource "azurerm_firewall" "firewall" {
  name                = "LandingZoneFirewall"
  location            = "East US"
  resource_group_name = "LandingZoneRG"
  sku_name            = "AZFW_VNet"
  sku_tier            = "Basic"

  ip_configuration {
    name                 = "firewall-ipconfig"
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_public_ip.id
  }

  management_ip_configuration {
    name                 = "firewall-management-ipconfig"
    subnet_id            = azurerm_subnet.firewall_management_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_management_public_ip.id
  }

  tags = {
    environment = "lab"
  }
}

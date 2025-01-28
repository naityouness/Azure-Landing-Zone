provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "vm-nic"
  location            = "East US" 
  resource_group_name = "LandingZoneRG"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/088b13f5-6629-4038-9bbf-4f95298fdf8f/resourceGroups/LandingZoneRG/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"
    private_ip_address_allocation = "Dynamic"
  }
}      

resource "azurerm_virtual_machine" "vm" {
  name                  = "ubuntu-vm"
  location              = "East US" # Replace with your location
  resource_group_name   = "LandingZoneRG"
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  vm_size               = "Standard_B1s" # Minimum spec VM

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS" # Or replace with a newer version
    version   = "latest"
  }

  os_profile {
    computer_name  = "ubuntu-vm"
    admin_username = "xxxxxx" # Update with your username
    admin_password = "xxxxx" # Update with your password or use ssh_keys
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

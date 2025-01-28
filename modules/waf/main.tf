provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f"
}

resource "azurerm_web_application_firewall_policy" "waf_policy" {
  name                = "WAFPolicy"
  resource_group_name = "LandingZoneRG"
  location            = "East US"

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  tags = {
    environment = "lab"
  }
}

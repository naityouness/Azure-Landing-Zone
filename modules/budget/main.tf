provider "azurerm" {
  features {}
  subscription_id = "088b13f5-6629-4038-9bbf-4f95298fdf8f" 
}


resource "azurerm_consumption_budget_subscription" "mystoragelab00001" {
  name            = "200-free-tier-budget-limit"
  subscription_id = "/subscriptions/088b13f5-6629-4038-9bbf-4f95298fdf8f"
  amount          = 150
  time_grain      = "Monthly"

  time_period {
    start_date = "2025-01-01T00:00:00Z"
    end_date   = "2025-12-31T23:59:59Z"
  }

  notification {
    enabled        = true
    operator       = "GreaterThan"
    threshold      = 80
    contact_emails = ["naityouness@gmail.com"]
  }

  notification {
    enabled        = true
    operator       = "GreaterThan"
    threshold      = 100
    contact_emails = ["naityouness@gmail.com"]
  }
}

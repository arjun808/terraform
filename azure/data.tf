
provider "azurerm" {
    subscription_id = "e0fffbed-1519-4c66-ad56-16dff98037b9"
}


data "azurerm_resource_group" "rc_group" {
  name = "DevOps301May2019"
}


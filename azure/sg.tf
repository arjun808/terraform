resource "azurerm_virtual_network" "vnet" {
    name                = "arjun_vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "${data.azurerm_resource_group.rc_group.location}"
    resource_group_name = "${data.azurerm_resource_group.rc_group.name}"

    tags {
            name        = "arjun_vnet"
    }
}

resource "azurerm_subnet" "subnet" {
  name                 = "arjun_subnet"
  resource_group_name = "${data.azurerm_resource_group.rc_group.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "nic" {
  name                = "arjun_nic"
  location            = "${data.azurerm_resource_group.rc_group.location}"
  resource_group_name = "${data.azurerm_resource_group.rc_group.name}"

  ip_configuration {
    name                          = "arjun_configuration"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "demo" {
  name                  = "arjun_demo_vm"
  location            = "${data.azurerm_resource_group.rc_group.location}"
  resource_group_name = "${data.azurerm_resource_group.rc_group.name}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  vm_size               = "Standard_DS1_v2"

  # delete_os_disk_on_termination = true
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "arjun_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "azure-demo"
    admin_username = "Admin"
    admin_password = "qwerty12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

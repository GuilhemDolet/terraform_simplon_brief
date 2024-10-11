terraform{
    required_version = ">= 1.1.0"
}

resource "azurerm_linux_virtual_machine" "my_vm" {
  name = "GuilhemVM"
  location = var.rg_location
  resource_group_name = var.rg_name
  network_interface_ids = [var.network_interface_ids]
  size = var.size

  os_disk {
    name = "guilhemOsDisk"
    caching = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }

  computer_name = "guiguiComputer"
  admin_username = var.admin_name

  admin_ssh_key {
    username   = var.admin_name
    public_key = var.ssh_public_key
  }

}
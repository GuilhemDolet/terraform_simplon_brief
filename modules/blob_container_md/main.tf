terraform{
    required_version = ">= 1.1.0"
}

# Azure blob container creation
resource "azurerm_storage_container" "guigui_container" {
  name = "guilhemcontainer08102024"
  storage_account_name = var.azurerm_storage_account_name
  container_access_type = "private"
  
}
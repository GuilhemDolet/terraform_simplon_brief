terraform{
    required_version = ">= 1.1.0"
}

data "azurerm_resource_group" "existing" {
    name = var.resource_group_name # nom du resource group
}
# Azure storage account creation
resource "azurerm_storage_account" "guigui_storage" {
  name = "guilhemsimplon08102024"
  resource_group_name = data.azurerm_resource_group.existing.name
  location = data.azurerm_resource_group.existing.location
  account_tier = "Standard"
  account_replication_type = "LRS" #Local Redundant Storage
}


terraform{
    required_version = ">= 1.1.0"
}


resource "azurerm_linux_web_app" "my_web_app" {
  name                = "guilhemWebApp"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = var.service_plan_id

  site_config {}
}
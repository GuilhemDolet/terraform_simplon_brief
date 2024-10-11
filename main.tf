# Configuration du provider
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}
# Initialisation du provider
provider "azurerm" {
  features {
    
  }
}

module "storage_account_module" {
  source = ".//modules/storage_account_md"
  resource_group_name = var.rg_name
}

module "blob_container" {
  source = ".//modules/blob_container_md"
  azurerm_storage_account_name = var.sa_name # instanciation de la variable, déclaré dans le fichier blob_container_md/variables.tf
  depends_on = [module.storage_account_module]
}

module "vm_module" {
  source = ".//modules/vm_md"
  # resource group
  rg_name = var.rg_name
  rg_location = var.rg_location
  # VM
  size = var.vm_size
  # os_disk
  storage_account_type = var.vm_storage_acount_type
  #reference_image 
  publisher = var.vm_image_publisher
  offer = var.vm_image_offer
  sku = var.vm_image_sku
  image_version = var.vm_image_version
  #id network interface
  network_interface_ids = var.vm_network_interface_id
  admin_name = var.vm_admin_name
  #admin_ssh_key
  ssh_public_key = var.vm_ssh_public_key
}

module "my_app" {
  source = ".//modules/web_app_md"
  resource_group_location = var.rg_location
  resource_group_name = var.rg_name
  service_plan_id = var.web_app_service_plan_id
}



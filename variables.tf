# Resource group variables
variable "rg_name" {
}
variable "rg_location" {
}

# Storage account variables
variable "sa_name" {
} 

# Network Interface ids
variable "vm_network_interface_id" {
}

# VM variables
variable "vm_size" {
}
variable "vm_storage_acount_type" {
}
variable "vm_image_publisher" {
}
variable "vm_image_offer" {
}
variable "vm_image_sku" {
}
variable "vm_image_version" {
}

variable "vm_admin_name" {
}
variable "vm_ssh_public_key" {
}


# linux web app variables
variable "web_app_service_plan_id" {
}

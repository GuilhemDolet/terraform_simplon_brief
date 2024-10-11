variable "rg_name" {
  description = "le nom du resource_group utilisé"
  type = string
}

variable "rg_location" {
  description = "la location du resource group"
  type = string
}

variable "network_interface_ids" {
  description = ""
  type = string
}

variable "admin_name" {
  description = ""
  type = string
}

variable "ssh_public_key" {
  description = "la clé publique SSH de la VM"
  type = string
}

variable "size" {
  description = "volume de la VM"
  type = string
}

variable "storage_account_type" {
  description = "le niveau de stockage"
  type = string
}

variable "publisher" {
  type = string
}

variable "offer" {
  type = string
}

variable "sku" {
  type = string
}

variable "image_version" {
  type = string
}

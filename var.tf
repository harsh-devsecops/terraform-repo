
variable "rg_name" {
  type        = any
  default     = "Harsh_terraform"
  description = "The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
}
variable "rg_location" {
  type        = string
  default     = "North Europe"
  description = "The location/region where the virtual network is created."
}
variable "owner" {
  type    = string
  default = "harsh"
}
variable "vnet_name" {
  type        = string
  default     = "vnet-network"
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}
variable "vnet_as" {
  type        = any
  default     = ["10.0.0.0/16"]
  description = " The address space that is used the virtual network. You can supply more than one address space"
}
variable "subnet_name" {
  type        = string
  default     = "VMsubnet"
  description = "The name of the subnet"
}
variable "subnet_prefix" {
  type        = any
  default     = ["10.0.2.0/24"]
  description = "The address prefix to use for the subnet"
}
variable "azurerm_interface" {
  type        = string
  default     = "azi-nic"
  description = ""
}
variable "ip_configuration" {
  type        = string
  default     = "internal"
  description = "value"
}
variable "private_ip" {
  type        = string
  default     = "Dynamic"
  description = "The Static IP Address which should be used"
}
variable "vm_name" {
  type    = string
  default = "TFVM"
}
variable "vm_size" {
  type    = string
  default = "Standard_F2"
}
variable "vm_admin_username" {
  type        = string
  default     = "adminuser"
  description = "The username of the local administrator used for the Virtual Machine"
}
variable "vm_admin_password" {
  type        = string
  default     = "P@$$w0rd1234!"
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
}
variable "os_caching" {
  type        = string
  default     = "ReadWrite"
  description = "The Type of Caching which should be used for the Internal OS Disk"
}
variable "os_account" {
  type        = string
  default     = "Standard_LRS"
  description = "storage_account_type"
}
variable "si_publisher" {
  type        = string
  default     = "MicrosoftWindowsServer"
  description = "source_image_reference"
}
variable "si_offer" {
  type        = string
  default     = "WindowsServer"
  description = "source_image_reference"
}
variable "si_sku" {
  type        = string
  default     = "2016-Datacenter"
  description = "source_image_reference"
}
variable "si_version" {
  type        = string
  default     = "latest"
  description = "source_image_reference"
}
variable "sa_name" {
  type        = string
  default     = "harsh07"
  description = "The name of azurerm_storage_account"
}
variable "sa_account_tier" {
  type        = string
  default     = "Standard"
  description = "Defines the Tier to use for this storage account"
}
variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Defines the type of replication to use for this storage account"
}
variable "environment" {
  type    = string
  default = "Learning"
}


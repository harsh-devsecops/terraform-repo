provider "azurerm" {

  features {}
}


# Create a resource group
resource "azurerm_resource_group" "az" {
  name     = var.rg_name
  location = var.rg_location

  tags = {
    owner = var.owner
  }
}
#resource "azurerm_virtual_network" "vnet" {
#  name                = var.vnet_name
#  address_space       = var.vnet_as
#  location            = azurerm_resource_group.az.location
#  resource_group_name = azurerm_resource_group.az.name
#}

#resource "azurerm_subnet" "subnet" {
  #name                 = var.subnet_name
  #resource_group_name  = azurerm_resource_group.az.name
  #virtual_network_name = azurerm_virtual_network.vnet.name
 # address_prefixes     = var.subnet_prefix
#}

#resource "azurerm_network_interface" "interface" {
 # name                = var.azurerm_interface
 # location            = azurerm_resource_group.az.location
 # resource_group_name = azurerm_resource_group.az.name

 # ip_configuration {
 #   name                          = var.ip_configuration
 #   subnet_id                     = azurerm_subnet.subnet.id
 #   private_ip_address_allocation = var.private_ip
#  }
#}

#resource "azurerm_windows_virtual_machine" "vm" {
#  name                = var.vm_name
#  resource_group_name = azurerm_resource_group.az.name
#  location            = azurerm_resource_group.az.location
#  size                = var.vm_size
#  admin_username      = var.vm_admin_username
#  admin_password      = var.vm_admin_password
#  network_interface_ids = [
#    azurerm_network_interface.interface.id,
 # ]

 # os_disk {
 #   caching              = var.os_caching
 #   storage_account_type = var.os_account
#  }

  #source_image_reference {
    #publisher = var.si_publisher
    #offer     = var.si_offer
   # sku       = var.si_sku
  #  version   = var.si_version
 # }
#}

#resource "azurerm_storage_account" "storage" {
 # name                     = var.sa_name
#  resource_group_name      = azurerm_resource_group.az.name
#  location                 = azurerm_resource_group.az.location
  #account_tier             = var.sa_account_tier
 # account_replication_type = var.account_replication_type

  #tags = {
  #  environment = var.environment
 # }
#}


# # Create a virtual network within the resource group
# resource "azurerm_virtual_network" "vnet" {
#   name                = "example-network"
#   resource_group_name = azurerm_resource_group.HK.name
#   location            = azurerm_resource_group.HK.location
#   address_space       = ["10.0.0.0/16"]
# }


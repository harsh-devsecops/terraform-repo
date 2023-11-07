terraform {
  backend "azurerm" {
    resource_group_name   = "Harsh_terraform"
    storage_account_name  = "dummyterraform1"
    container_name        = "terrraformstate"
    key                   = "sample/vm"
  }
}

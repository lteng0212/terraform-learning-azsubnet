provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
   tags     = {
        "Environment" = "Terraform Getting Started"
        "Team"        = "DevOps123"
    }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}

output "jenkins_terraform" {
  value = azurerm_virtual_network.vnet.name
}
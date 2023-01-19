provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = "westus2"
   tags     = {
        "Environment" = "Terraform Getting Started"
        "Team"        = "DevOps123"
    }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.private_subnet_name
  address_space       = var.private_subnet_cidrs
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}

output "jenkins_terraform" {
  value = azurerm_virtual_network.vnet.name
}
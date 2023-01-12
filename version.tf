# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
    storage_account_name = "lterraformstorage"
    container_name       = "terraform-state"
    key                  = "ltazsub.tfstate"
  }

  required_version = ">= 1.1.0"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  # This stores your 'memory' in Azure for free
  backend "azurerm" {
    resource_group_name  = "rg-terraform-sea"
    storage_account_name = "stterraformsea01" # Change this!
    container_name       = "tfstate"
    key                  = "rg-test-eastus.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-test-eastus"
  location = "East US"
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "rg_name" {
  type = string
  default = "dev-rg1"
}

variable "location" {
  type = string
  default = "westus"
}

resource "azurerm_resource_group" "name1" {
  name = var.rg_name
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.name1.name
}
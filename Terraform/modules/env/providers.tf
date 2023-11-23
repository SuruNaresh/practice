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

//terraform {
//  backend "local" {
//    path = "dev.tfstate"
//  }
//}
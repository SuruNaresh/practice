terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name = {{ terraformrg }}
    storage_account_name = {{ terraformstorage }}
    container_name = {{ container }}
    key = {{ statefilename }}
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
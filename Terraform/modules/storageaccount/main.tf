data "azurerm_resource_group" "this" {
  name = var.rg_name
}

resource "azurerm_storage_account" "this" {
  name = var.storage_name
  resource_group_name = data.azurerm_resource_group.this.name
  location = data.azurerm_resource_group.this.location
  access_tier = "Hot"
  account_kind = "StorageV2"
  account_tier = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_resource_group" "this" {
  name = var.rg_name
  location = var.location
  lifecycle {
    prevent_destroy = true
  }
}
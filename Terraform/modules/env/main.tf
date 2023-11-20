//module "resourcegroup" {
//  source = "../resourcegroup"
//  rg_name = var.rg_name
//  location = var.location
//}

module "storage" {
  source = "../storageaccount"
  rg_name = azurerm_resource_group.this.name
  storage_name = var.storage_name
  depends_on = [ 
    azurerm_resource_group.this
  ]
}

resource "azurerm_resource_group" "this" {
  name = var.rg_name
  location = var.location
  tags = {
    environment = "dev"
  }
  lifecycle {
    prevent_destroy = true
  }
}
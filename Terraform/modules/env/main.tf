module "resourcegroup" {
  source = "../resourcegroup"
  rg_name = var.rg_name
  location = var.location
}

module "storage" {
  source = "../storageaccount"
  rg_name = module.resourcegroup.resource_group_name
  storage_name = var.storage_name
  depends_on = [ 
    module.resourcegroup 
  ]
}
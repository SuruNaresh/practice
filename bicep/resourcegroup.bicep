targetScope = 'subscription'

param resourcegroupname string = 'qa-rg'
param location string = 'westus'

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourcegroupname
  location: location
}

module sa 'storageaccount.bicep' = {
  name: 'devascfvgfd'
  scope: resourceGroup(rg.name)
  params:{
    storageName: 'devascfvgfd'
    location: rg.location
    Sku: 'Standard_LRS'
    kind: 'StorageV2'
  }
}

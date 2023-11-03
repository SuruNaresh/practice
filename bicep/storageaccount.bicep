param storageName string
param location string
param Sku string
param kind string
param accesstier string = 'Hot'

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01'= {
  name: storageName
  location: location
  sku: {
    name: Sku
  }
  kind: kind
  properties:{
    accessTier: accesstier
    supportsHttpsTrafficOnly: true
  }
}

output storageaccountname string = storage.name

targetScope = 'subscription'

param envname string
param resourcegroupname string
param location string

module resourcegroup 'resourcegroup.bicep' = {
  name: resourcegroupname
  params:{
    resourcegroupname: resourcegroupname
    location: location
  }
}

param storagename string
param storagesku string

module storageaccount 'storageaccount.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: storagename
  params:{
    storageName: storagename
    location: location
    Sku: storagesku
    kind: 'StorageV2'
  }
  dependsOn:[
    resourcegroup
  ]
}

param nsgshortname string

module nsg 'nsg.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: nsgshortname
  params: {
    envname: envname
    nsgshortname: nsgshortname
    location: location
  }
  dependsOn:[
    resourcegroup
  ]
}

param ipshortname string

module publicip 'publicip.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: ipshortname
  params: {
    envname: envname
    ipshortname: ipshortname
    location: location
  }
  dependsOn:[
    resourcegroup
  ]  
}

targetScope = 'subscription'

param envname string = 'qa'
param resourcegroupname string = 'qa-rg'
param location string = 'westus'

module resourcegroup 'resourcegroup.bicep' = {
  name: resourcegroupname
  params:{
    resourcegroupname: resourcegroupname
    location: location
  }
}

param storagename string = 'qasrdfdfv'
param storagesku string = 'Standard_LRS'

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

param nsgshortname string = 'fun-app'

module nsg 'nsg.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: '${nsgshortname}-nsg'
  params: {
    envname: envname
    nsgshortname: nsgshortname
    location: location
  }
  dependsOn:[
    resourcegroup
  ]
}

param ipshortname string = 'fun-app'

module publicip 'publicip.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: '${ipshortname}-pip'
  params: {
    envname: envname
    ipshortname: ipshortname
    location: location
  }
  dependsOn:[
    resourcegroup
  ]  
}

param vnetshortname string = 'fun'
param vnetaddressprefix string = '10.0.0.0/16'
module vnet 'virtualnetwork.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: vnetshortname
  params:{
    envname: envname
    location: location
    vnetshortname: vnetshortname
    addressprefix: vnetaddressprefix
  }
  dependsOn: [
    resourcegroup
  ]
}

param subnetname string = 'frontend'
param subnetaddressprefix string = '10.0.0.0/24'
module subnet 'subnet.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: subnetname
  params:{
    vnetname: vnet.outputs.vnetname
    subnetname: subnetname
    nsgname: nsg.outputs.nsgname
    addressprefix: subnetaddressprefix
  }
}

param nicshortname string = 'fun-app'
module nic 'nic.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: '${nicshortname}-nic'
  params:{
    envname: envname
    nicshortname: nicshortname
    location:location
    publicipname: publicip.outputs.publicipname
    subnetid: subnet.outputs.subnetid
  }
}

param vmshortname string = 'fun-app'
param vmsize string = 'Standard_B2ms'
param username string = 'vmadmin'
@secure()
param password string = 'Password@123'
param osversion string = '2016-datacenter-server-core-g2'
module vm 'vm.bicep' = {
  scope: resourceGroup(resourcegroup.name)
  name: '${vmshortname}-vm'
  params:{
    envname: envname
    vmshortname: vmshortname
    location: location
    vmsize: vmsize
    username: username
    password: password
    OSVersion: osversion
    nicid: nic.outputs.nicid
    storagename: storageaccount.outputs.storageaccountname
  }
}

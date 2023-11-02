@description('This parameter helps you to pass storage account name')
param storageaccountname string = 'sfdsgsgvrs'

@description('public access should be enabled or disabled')
param publicaccess bool = false

@description('provide tier of it either Hot or cool')
@allowed([
  'Hot'
  'Cool'
])
param accesstier string = 'Hot'

@description('description')
param sqlname string

@description('description')
param sqllogin string

@description('description')
@secure()
param sqlpassword string

@description('description')
param sqldbname string = 'envsqldb'

var httpstraffic = true
var kind = 'StorageV2'
param location string = 'westus'

resource storageaccountname_resource 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageaccountname
  location: location
  kind: kind
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    accessTier: accesstier
    allowBlobPublicAccess: publicaccess
    supportsHttpsTrafficOnly: httpstraffic
  }
}

resource sqlname_resource 'Microsoft.Sql/servers@2022-11-01-preview' = {
  name: sqlname
  location: location
  properties: {
    version: '12.0'
    administratorLogin: sqllogin
    administratorLoginPassword: sqlpassword
    publicNetworkAccess: 'Enabled'
    minimalTlsVersion: '1.2'
  }
}

resource sqlname_sqldbname 'Microsoft.Sql/servers/databases@2022-11-01-preview' = {
  parent: sqlname_resource
  name: sqldbname
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
  properties: {
    requestedBackupStorageRedundancy: 'Local'
  }
}

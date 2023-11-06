param deploystorage bool

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = if(deploystorage) {

}

param env string

resource rg 'Microsoft.Storage/storageAccounts@2023-01-01'= if (env == 'prod') {
  name: 'test-rg'
  location: 'westus'
}

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(deployment().name)}'
  location: ((env == 'prod') ? 'westus' : 'eastus')
}


param containers array = [
  'test','images','demo'
]

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = [for container in containers :{
  name:container
}]

param storagedata array = [
  {
    name: 'sadckjfv'
    location: 'eastus'
  }
  {
    name: 'kccggfh'
    location: 'eastus'
  }
]

resource storagecopy 'Microsoft.Storage/storageAccounts@2023-01-01' = [for storage in storagedata : {
  name: storage.name
  location: storage.location
}]






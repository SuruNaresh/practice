param envname string
param vmshortname string
param location string
param vmsize string
param username string
@secure()
param password string
param OSVersion string
param nicid string
param storagename string

var name = '${envname}-${vmshortname}-vm'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storagename
}

resource vm 'Microsoft.Compute/virtualMachines@2023-07-01'={
  name: name
  location: location
  properties:{
    hardwareProfile:{
      vmSize: vmsize
    }
    osProfile:{
      adminUsername: username
      adminPassword: password
      computerName: name
    }
    storageProfile:{
      imageReference:{
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: OSVersion
        version: 'latest'
      }
      osDisk:{
        createOption:'FromImage'
        managedDisk:{
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile:{
      networkInterfaces:[
        {
          id: nicid
        }
      ]
    }
    diagnosticsProfile:{
      bootDiagnostics:{
        enabled: true
        storageUri: storageaccount.properties.primaryEndpoints.blob
      }
    }
  }
}

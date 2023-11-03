param envname string
param nicshortname string
param location string
param publicipname string
param subnetid string

var name = '${envname}-${nicshortname}-nic'
var ipconfigname = '${envname}${nicshortname}'

resource pip 'Microsoft.Network/publicIPAddresses@2023-05-01' existing = {
  name: publicipname
}

resource nic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: name
  location: location
  properties: {
    ipConfigurations:[
      {
        name: ipconfigname
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress:{
            id: pip.id
          }
          subnet:{
            id: subnetid
          }
        }
      }
    ]
  }
}

output nicid string = nic.id

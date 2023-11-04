param envname string
param nsgshortname string
param location string

var nsgname = '${envname}-${nsgshortname}-nsg'

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-05-01' = {
  name: nsgname
  location: location
  properties:{
    securityRules:[
      {
        name: 'port3389'
        properties:{
          priority: 1000
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '3389'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'port80'
        properties:{
          priority: 200
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '80'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'port443'
        properties:{
          priority: 300
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '443'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

output nsgname string = nsg.name

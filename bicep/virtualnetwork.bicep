param envname string
param vnetshortname string
param location string
param addressprefix string

var name = '${envname}-${vnetshortname}-vnet'

resource virtual 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: name
  location: location
  properties: {
    addressSpace:{
      addressPrefixes:[
        addressprefix
      ]
    }
  }
}

output vnetname string = virtual.name

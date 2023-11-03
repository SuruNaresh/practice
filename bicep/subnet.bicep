param vnetname string
param subnetname string
param nsgname string
param addressprefix string

resource virtual 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: vnetname
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01'existing = {
  name: nsgname
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  parent: virtual
  name: subnetname
  properties: {
    addressPrefix: addressprefix
    networkSecurityGroup: {
      id:nsg.id
    }
  }
}

output subnetid string = subnet.id

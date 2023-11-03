param envname string
param ipshortname string
param location string

var publicIpName = '${envname}-${ipshortname}-pip'

resource pip 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: publicIpName
  location: location
  sku:{
    name: 'Standard'
    tier: 'Regional'
  }
  properties:{
    publicIPAllocationMethod: 'Dynamic'
  }
}

targetScope = 'subscription'

param resourcegroupname string 
param location string

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourcegroupname
  location: location
}

output rgname string = rg.name

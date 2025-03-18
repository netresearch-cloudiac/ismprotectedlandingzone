@description('Location')
param location string

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: 'ism-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: 'default-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource nsgAssociation 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: 'ism-vnet/default'
  properties: {
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

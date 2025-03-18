@description('Root Management Group ID')
param rootManagementGroupId string

@description('Subscription ID')
param subscriptionId string

@description('Location for resources')
param location string = 'australiaeast'

resource mgRoot 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: rootManagementGroupId
}

resource mgLandingZone 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'landing-zone'
  properties: {
    displayName: 'ISM Landing Zone'
    parentId: mgRoot.id
  }
}

module azurePolicies './azure-policy.bicep' = {
  name: 'ISM-Policy-Deployment'
  params: {
    targetManagementGroup: mgLandingZone.id
  }
}

module monitoring './monitoring.bicep' = {
  name: 'Enable-Monitoring'
  params: {
    subscriptionId: subscriptionId
    location: location
  }
}

module networking './networking.bicep' = {
  name: 'Setup-Networking'
  params: {
    location: location
  }
}

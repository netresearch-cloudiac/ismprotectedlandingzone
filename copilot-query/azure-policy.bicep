@description('Management Group to assign policies')
param targetManagementGroup string

resource builtInPolicy 'Microsoft.Authorization/policyDefinitions@2021-06-01' existing = {
  name: 'SecurityCenterBuiltIn'
}

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2021-06-01' = {
  name: 'ISM-Security-Baseline'
  properties: {
    policyDefinitionId: builtInPolicy.id
    scope: targetManagementGroup
    displayName: 'ISM Security Baseline'
    enforcementMode: 'Default'
  }
}

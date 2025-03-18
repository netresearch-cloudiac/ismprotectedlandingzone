@description('Subscription ID')
param subscriptionId string

@description('Location')
param location string

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: 'ism-log-analytics'
  location: location
  properties: {
    retentionInDays: 30
  }
}

resource diagnosticsSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'DefaultDiagnostics'
  scope: subscription()
  properties: {
    logs: [
      {
        category: 'Administrative'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 30
        }
      }
    ]
    workspaceId: logAnalytics.id
  }
}

# ismprotectedlandingzone
Deploy an ISM protected landing zone in Azufre

# Prompt to AI
## cluade.ai
```string
Assume ro

```

## Step 1: Prerequisites
Ensure you have Owner or Contributor role at the Tenant Root Group.

Install Azure CLI and Bicep CLI.

Set up a Service Principal for automation:
```shell
az ad sp create-for-rbac --role Contributor --scopes /subscriptions/{subscriptionId}
```

## Step 2: Authenticate with Azure
Run the following:
```shell
az login
```

## Step 3: Deploy the Landing Zone
Use the Azure CLI to deploy all modules.
```shell
az deployment tenant create --template-file main.bicep --parameters rootManagementGroupId='root-mg-id' subscriptionId='your-subscription-id'

```

## Step 4: Validate the Deployment
Go to the Azure Portal:

Check Management Groups for the new Landing Zone.

Verify Policies under Policy Assignments.

Confirm Log Analytics and diagnostic settings in Azure Monitor.

Ensure VNet and NSG configurations under Virtual Networks.


## Step 5: Automate Deployment (Optional)
Use GitHub Actions for continuous deployment:

Create a workflow that runs az deployment tenant create automatically.

Example:

```shell
name: Deploy Landing Zone

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Azure CLI Login
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}

      - name: Deploy Bicep
        run: |
          az deployment tenant create --template-file main.bicep --parameters rootManagementGroupId='root-mg-id' subscriptionId='${{ secrets.SUBSCRIPTION_ID }}'
```
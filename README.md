# Azure ISM PROTECTED Landing Zone

This repository contains Infrastructure as Code (IaC) for deploying an Australian ISM PROTECTED compliant landing zone in Azure. The deployment is automated using GitHub Actions and Terraform.

## Architecture Overview

The landing zone implements the following components aligned with Australian ISM PROTECTED requirements:

- **Network Segmentation**: Virtual Network with properly segmented subnets
- **Security Controls**: 
  - Network Security Groups with strict security rules
  - Azure Firewall for advanced traffic filtering
  - Azure Bastion for secure remote access
- **Encryption**: 
  - Storage Account with encryption at rest
  - Key Vault with PROTECTED controls
- **Monitoring and Logging**:
  - Log Analytics Workspace for centralized logging
  - Azure Security Center (Defender for Cloud) monitoring
- **Compliance**:
  - Azure Policy assignments for ISM PROTECTED compliance
  - Secure configuration baseline for all resources

## Prerequisites

1. Azure Subscription (already created)
2. Service Principal with Contributor permissions on the subscription
3. GitHub repository with proper secrets configured

## GitHub Secrets Configuration

The following secrets need to be configured in your GitHub repository:

- `AZURE_CLIENT_ID`: Service Principal client ID
- `AZURE_CLIENT_SECRET`: Service Principal client secret
- `AZURE_SUBSCRIPTION_ID`: Your Azure subscription ID
- `AZURE_TENANT_ID`: Your Azure tenant ID

## Deployment Process

The deployment is handled by GitHub Actions and follows these steps:

1. **Validation**: Validates the Terraform code and creates a plan
2. **Deployment**: Applies the Terraform plan to create the resources

## ISM PROTECTED Compliance

This landing zone implements the following ISM PROTECTED controls:

- **Access Control**: Least privilege principle applied throughout
- **Network Security**: Deny by default, allow only necessary traffic
- **Encryption**: All data encrypted at rest and in transit
- **Logging and Monitoring**: Comprehensive logging and monitoring
- **Secure Configuration**: Hardened baseline for all resources

## Post-Deployment Tasks

After the landing zone is deployed, complete these tasks:

1. Review security recommendations in Azure Security Center
2. Implement additional workload-specific security controls
3. Configure backup and disaster recovery
4. Implement regular compliance audits

## Support

For questions or issues, please contact your cloud security team.
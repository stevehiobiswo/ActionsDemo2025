GitHub Actions and Terraform Deployment Samples
===============================================

This repository contains sample files demonstrating how to utilize GitHub Actions in conjunction with Terraform to deploy resources to Microsoft Azure.

Overview
--------

Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and provision infrastructure using a declarative configuration language. By integrating Terraform with GitHub Actions, you can automate your infrastructure deployments, ensuring consistency and reliability. This repository provides examples and workflows to help you get started with this integration.

Contents
--------

*   **.github/workflows/**: Contains GitHub Actions workflow files that define the automation processes.
    
*   **terraform/**: Holds Terraform configuration files for deploying various Azure resources.
    

Prerequisites
-------------

Before using the samples in this repository, ensure you have the following:

*   **Azure Subscription**: Active subscription to deploy resources.
    
*   **Azure Resource Group**: A resource group to be used for the deployment.
    
*   **GitHub Account**: To set up and run GitHub Actions.
    
*   **Azure Storage Account**: To store Terraform state files remotely.

*   **Azure Service Principal**: For GitHub Actions to authenticate and deploy resources to Azure. Also needs appropriate rights on the Storage Account.
    

Getting Started
---------------

1.  git clone https://github.com/HaikoHertes/ActionsDemo2025.simple.git

2.  **Configure Remote Backend for Terraform State**:
    
    *   Create an Azure Storage Account to store Terraform state files.
  
    *   Make sure the Service Principal has appropriate rights on the Storage Account to create and write the TF state file.
    
3.  **Set Up Azure Credentials**:
    
    *   az ad sp create-for-rbac --name "GitHubActionsDemo" --role Contributor --scopes /subscriptions/{SUBSCRIPTION\_ID}/resourceGroups/{RESOURCE\_GROUP\_NAME} --json-auth
        
    *   Note the JSON output, which contains your Azure credentials.
        
    *   Add the following secrets to your GitHub repository under "Settings" > "Secrets and variables" > "Actions":
        
        *   AZURE\_CREDS: The JSON output from the previous step.
            
        *   AZURE\_SUB\_ID: Your Azure Subscription ID.
     
        *   ARM\_CLIENT\_ID: Client ID for the Service Principal from the JSON above
     
        *   ARM\_CLIENT\_SECRET: Client Secret for the Service Principal from the JSON above
     
        *   ARM\_TENANT\_ID: Tenant ID for the Service Principal from the JSON above
     
        *   STORAGE\_ACCOUNT\_NAME: Name of Storage Account to be used for TF state file
     
        *   STORAGE\_CONTAINER\_NAME: Name of Storage Account Blob Container to be used for TF state file
        
4.  **Review and Modify Terraform Configurations**:
    
    *   Navigate to the terraform/ directory and review the provided .tf files.
        
    *   Modify them as needed to fit your specific requirements.
        
5.  **Configure GitHub Actions Workflows**:
    
    *   Examine the workflows in .github/workflows/.
        
    *   Adjust the workflows to reference your Terraform configurations and any specific deployment parameters.
        
6.  **Trigger the Workflow**:
    
    *   Push changes to the repository or manually trigger the workflow via the GitHub Actions tab.
        

Resources
---------

*   Terraform Documentation
    
*   [GitHub Actions Documentation](https://docs.github.com/actions)
    
*   [Deploy Azure Resources with Terraform and GitHub Actions](https://learn.microsoft.com/en-us/samples/azure-samples/terraform-github-actions/terraform-github-actions/)
    

Contributing
------------

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

License
-------

This project is licensed under the MIT License. See the LICENSE file for details.

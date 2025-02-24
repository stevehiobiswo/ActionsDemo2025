##
# Terraform Configuration
##

terraform {

  backend "azurerm" {
    resource_group_name  = "actionsdemo2025hiobi"
    storage_account_name = "actionsdemo2025hiobi"
    container_name       = "tfstate"
    key                  = "github.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

##
# Providers
##

provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}
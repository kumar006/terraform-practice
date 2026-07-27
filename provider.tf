# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    version = "=4.5.0" }
  }

  # backend "azurerm" {
  #   use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
  #   use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
  #   tenant_id            = "c1aae038-283e-4441-b1ea-d10a577c3cb6"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
  #   storage_account_name = "table1494"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
  #   container_name       = "new-file-container"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
  #   key                  = "backend.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  # }

  
  backend "azurerm" {
    resource_group_name  = "rg-table"
    storage_account_name = "table1494"
    container_name       = "new-file-container"
    key                  = "backend.terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}



  subscription_id = "03ae0d8b-56f1-4438-b3ce-c57dc4f35df6"
}



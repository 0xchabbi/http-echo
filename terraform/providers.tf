terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.30.0"
    }
   azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

provider "azuredevops" {
    org_service_url = "https://dev.azure.com/bchabbi"
    personal_access_token = "eufyxzqatfhfyywr74oksfsu3y75rq4haj5nbamjfhdgzdsyx6nq"
  }

provider "azurerm" {
  subscription_id = "8fdfcd42-cb6a-4f09-bd1d-984a332c84b1"
  skip_provider_registration = "true"
  features {}
}



provider "kubernetes" {
  config_path = local_file.kubeconfig
  config_context = var.cluster_name
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.49.0"
    }
   azuredevops = {
      source = "microsoft/azuredevops"
      version = "=0.4.0"
    }
  }
}

provider "azuredevops" {
    org_service_url = "https://dev.azure.com/bchabbi"
    personal_access_token = "eufyxzqatfhfyywr74oksfsu3y75rq4haj5nbamjfhdgzdsyx6nq"
  }

provider "azurerm" {
  subscription_id = "8fdfcd42-cb6a-4f09-bd1d-984a332c84b1"
  client_id = "f61a039f-a058-4a09-89ec-f7184d066fdd"
  client_secret = "2DR8Q~gh0zxGbwKwYRDMujLam1kZKcHE4~s~baHf"
  tenant_id = "fdef0e9e-1806-4ce4-aa18-c0108177ce02"
  skip_provider_registration = "true"
  features {}
}



provider "kubernetes" {
  config_path = local_file.kubeconfig
  config_context = var.cluster_name
}


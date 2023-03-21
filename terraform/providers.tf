terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.30.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  config_path = local_file.kubeconfig
  config_context = var.cluster_name
}


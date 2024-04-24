terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }
  }
}
provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "rg" {
 location = "westeurope"
 name = "rg-projdevops-0001"
 tags = merge(var.tags, 
      {"workspace" = "${terraform.workspace}"}
  )
}

resource "azurerm_storage_account" "site" {
  name = "stprojdevops0001"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_kind = "StorageV2"
  account_tier = "Standard"
  account_replication_type ="LRS"
  enable_https_traffic_only = true

  static_website{
    index_document = "index.html"
  }

   tags = merge(var.tags, 
      {"workspace" = "${terraform.workspace}"}
  )
}
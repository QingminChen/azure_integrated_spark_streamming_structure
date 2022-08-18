#In Used#
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.27.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.18.0"
    }
  }
}

provider "azuread" {
  alias = "azrd_auth_connect_user"
  tenant_id = "2890298d-6798-4ee8-8e84-320d2c1268cb"
}

provider "azurerm" {
  alias = "azrm_auth_connect_user"
  tenant_id = "2890298d-6798-4ee8-8e84-320d2c1268cb"
  features {
  }
}

locals {
  module_path        = abspath(path.root)
}

module "app_create" {
  source = "./modules/app_create"   //used
  providers = {
     azuread = azuread.azrd_auth_connect_user
     azurerm = azurerm.azrm_auth_connect_user
  }
}

module "env_init" {
  source = "./modules/env_init"   //used
  app_create_out_sp_depends_on = [module.app_create.sp_create_depends_on]
  app_client_id = module.app_create.app_client_id
  app_service_principal_object_id = module.app_create.app_service_principal_object_id
  client_current_tenant_id = module.app_create.client_current_tenant_id
  client_secret_value = module.app_create.client_secret_value
  subcription_id = module.app_create.subcription_id
  root_pass_home_path =local.module_path
}
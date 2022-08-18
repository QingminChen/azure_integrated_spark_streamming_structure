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



#In Used#
data "azuread_client_config" "current" {
  provider = azuread
}

#In Used#
data "azurerm_subscription" "primary" {
  provider = azurerm
}



#In Used#
resource "azuread_application" "test_active_directory_tf" {
  provider = azuread
  display_name     = "test_active_directory_tf"
//  identifier_uris  = ["api://example-app"]
//  logo_image       = filebase64("/path/to/logo.png")
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMyOrg"
  web {
    redirect_uris = ["https://qingmin.com/auth"]
  }
}

#In Used#
resource "azuread_service_principal" "test_active_directory_tf" {
  provider = azuread
  application_id = azuread_application.test_active_directory_tf.application_id
  app_role_assignment_required = false
  feature_tags {
    enterprise = true
    gallery = false
  }
  depends_on = [azuread_application.test_active_directory_tf]
}

#In Used#
resource "azuread_application_password" "test_active_directory_client_tf" {
  provider = azuread
  application_object_id = azuread_application.test_active_directory_tf.id
  display_name = "test_active_directory_client_tf"
  end_date = "2022-10-27T00:00:00Z"
  depends_on = [azuread_service_principal.test_active_directory_tf]
}

resource "azurerm_role_assignment" "service_principal_2_subcription" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.test_active_directory_tf.object_id
  skip_service_principal_aad_check = true
  depends_on = [azuread_service_principal.test_active_directory_tf]
}




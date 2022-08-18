output "client_current_tenant_id" {
  value = "${data.azuread_client_config.current.tenant_id}"
}

output "app_service_principal_object_id" {
  value = "${azuread_service_principal.test_active_directory_tf.object_id}"
}

output "app_id" {
  value = "${azuread_application.test_active_directory_tf.id}"
}

output "app_client_id" {
  value = "${azuread_application.test_active_directory_tf.application_id}"
}

output "client_secret_value" {
  value       = "${azuread_application_password.test_active_directory_client_tf.value}"
  sensitive   = true
}

output "subcription_id" {
  value       = "${data.azurerm_subscription.primary.subscription_id}"
}

output "sp_create_depends_on" {
//  type         = any
  value        = {}
  depends_on   = [azurerm_role_assignment.service_principal_2_subcription]
}
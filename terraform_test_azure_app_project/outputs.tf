output "app_service_principal_object_id" {
  value = "${module.app_create.app_service_principal_object_id}"
}

output "app_id" {
  value = "${module.app_create.app_id}"
}


output "app_client_id" {
  value = "${module.app_create.app_client_id}"
}

output "client_secret_value" {
  value       = "${module.app_create.client_secret_value}"
  sensitive   = true
}

output "client_current_tenant_id" {
  value = "${module.app_create.client_current_tenant_id}"
}


output "subcription_id" {
  value = "${module.app_create.subcription_id}"
}



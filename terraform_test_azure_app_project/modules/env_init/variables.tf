variable "app_client_id" {
  type = string
}

variable "app_service_principal_object_id" {
  type = string
}

variable "client_current_tenant_id" {
  type = string
}

variable "client_secret_value" {
  type = string
}

variable "subcription_id" {
  type = string
}

variable "root_pass_home_path" {
  type = string
}

variable "app_create_out_sp_depends_on" {
  type    = any
  default = []
}

resource "local_file" "generate_shell_script_for_evn_init" {
    content  = "#!/bin/bash\nexport ARM_CLIENT_ID=${var.app_client_id}\nexport ARM_CLIENT_SECRET=${var.client_secret_value}\nexport ARM_TENANT_ID=${var.client_current_tenant_id}\nexport AZURE_CLIENT_ID=${var.app_client_id}\nexport AZURE_CLIENT_SECRET=${var.client_secret_value}\nexport AZURE_TENANT_ID=${var.client_current_tenant_id}\nexport ARM_SUBSCRIPTION_ID=${var.subcription_id}"
    filename = "${var.root_pass_home_path}/generate_shell_script_for_evn_init.sh"
}

resource "null_resource" "execute_env_init" {

  provisioner "local-exec" {

    working_dir = "${var.root_pass_home_path}"
//    interpreter = ["/bin/bash", "-c"]
    command = "${var.root_pass_home_path}/generate_shell_script_for_evn_init.sh"
    when = create
  }
  depends_on = [local_file.generate_shell_script_for_evn_init]
}

//resource "null_resource" "execute_logout" {
//
//  provisioner "local-exec" {
//
//    working_dir = "${var.root_pass_home_path}"
////    interpreter = ["/bin/bash", "-c"]
//    command = "az logout"
//    when = create
//  }
//  depends_on = [null_resource.execute_env_init]
//}
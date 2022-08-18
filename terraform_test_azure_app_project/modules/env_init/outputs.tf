output "env_init_depends_on" {
//  type         = any
  value        = {}
  depends_on   = [null_resource.execute_env_init]
}
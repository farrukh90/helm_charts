module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git" #
  deployment_name        = "csamatov96-hello-world" #helm chart naming 
  deployment_environment = "test" #
  deployment_endpoint    = "csamatov96-hello-world.fuchicorp.com" #DNS to access 
  deployment_path        = "csamatov96-hello-world" #helm chart naming 
  #
  template_custom_vars = {
    deployment_image = "nginx"
  }
}
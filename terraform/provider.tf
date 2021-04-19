
provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.do_spaces_access_key
  spaces_secret_key = var.do_spaces_secret
}

provider "kubernetes" {
  config_path = "${path.root}/kubeconfig"
}

provider "helm" {
  kubernetes {
    config_path = "${path.root}/kubeconfig"
  }
}

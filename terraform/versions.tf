terraform {
  required_providers {
    digitalocean = {
      version = "~> 2.7"
    }
    helm = {
      version = ">=2.0.1"
    }
    kubernetes = {
      version = "2.1.0"
    }
  }
  required_version = ">= 0.12"
}

variable "do_token" {
  default = null
  type    = string
}

variable "do_spaces_secret" {
  default = null
  type    = string
}
variable "do_spaces_access_key" {
  default = null
  type    = string
}

variable "cluster_name" {
  default = "querido-diario"
  type    = string
}

variable "node_size" {
  default = "s-1vcpu-2gb"
  type    = string
}

variable "node_count" {
  default = 2
}

variable "region" {
  default = "nyc3"
}

variable "postgres" {
  type = object({
    name       = string
    version    = string
    size       = string
    region     = string
    node_count = number
    database   = string
    user       = string
    password   = string
  })
  default = {
    name       = "querido-diario-db"
    version    = "11"
    size       = "db-s-1vcpu-1gb"
    region     = "nyc3"
    node_count = 1
    database   = "querido-diario"
    user       = "querido-diario"
    password   = "querido-diario"
  }
}

variable "default_tag" {
  default = "querido-diario"
  type    = string
}

variable "registry" {
  type = object({
    name                   = string
    subscription_tier_slug = string
  })
  default = {
    name                   = "querido-diario"
    subscription_tier_slug = "starter"
  }
}

variable "load_balancer" {
  type = object({
    name                   = string
    redirect_http_to_https = bool
    forwarding_rule = object({
      entry_port      = number
      entry_protocol  = string
      target_port     = number
      target_protocol = string
    })
    healthcheck = object({
      port     = number
      protocol = string
    })
  })
  default = {
    name                   = "querido-diario-load-balancer"
    redirect_http_to_https = true
    forwarding_rule = {
      entry_port      = 80
      entry_protocol  = "http"
      target_port     = 80
      target_protocol = "http"
    }
    healthcheck = {
      port     = 22
      protocol = "tcp"
    }

  }
}

variable "spaces" {
  type = object({
    name = string
    acl  = string
  })
  default = {
    name = "querido-diario"
    acl  = "public-read"
  }
}


variable "write_kubeconfig" {
  type    = bool
  default = false
}

variable "elasticsearch" {
  type = object({
    name       = string
    repository = string
    chart      = string
    version    = string
  })
  default = {
    name       = "querido-diario-elasticsearch"
    namespace  = "querido-diario"
    repository = "https://helm.elastic.co"
    chart      = "elasticsearch"
    version    = "7.12.1"
  }
}

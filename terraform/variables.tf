variable "do_token" {
  default = null
  type    = string
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
  })
  default = {
    name       = "querido-diario-db"
    version    = "13"
    size       = "db-s-1vcpu-1gb"
    region     = "nyc3"
    node_count = 1
    database   = "querido_diario"
    user       = "querido_diario"
  }
}

variable "default_tag" {
  default = "querido-diario"
  type    = string
}

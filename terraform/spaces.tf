resource "digitalocean_spaces_bucket" "querido-diario-spaces" {
  name   = var.spaces.name
  region = var.region
  acl    = var.spaces.acl
}

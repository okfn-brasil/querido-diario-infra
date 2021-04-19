resource "digitalocean_loadbalancer" "public" {
  name   = var.load_balancer.name
  region = var.region

  forwarding_rule {
    entry_port     = var.load_balancer.forwarding_rule.entry_port
    entry_protocol = var.load_balancer.forwarding_rule.entry_protocol

    target_port     = var.load_balancer.forwarding_rule.target_port
    target_protocol = var.load_balancer.forwarding_rule.target_protocol
  }

  healthcheck {
    port     = var.load_balancer.healthcheck.port
    protocol = var.load_balancer.healthcheck.protocol
  }

  droplet_tag = var.default_tag
}

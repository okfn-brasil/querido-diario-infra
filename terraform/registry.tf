resource "digitalocean_container_registry" "querido-diario-registry" {
  name                   = var.registry.name
  subscription_tier_slug = var.registry.subscription_tier_slug
}

resource "digitalocean_database_cluster" "querido-diario-db" {
  name       = var.postgres.name
  engine     = "pg"
  version    = var.postgres.version
  size       = var.postgres.size
  region     = var.region
  node_count = var.postgres.node_count
  tags       = [var.default_tag]
}

data "digitalocean_database_cluster" "querido-diario-db" {
  depends_on = [digitalocean_database_cluster.querido-diario-db]
  name       = var.postgres.name
}

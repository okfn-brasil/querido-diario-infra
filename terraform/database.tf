resource "digitalocean_database_cluster" "querido_diario_db_cluster" {
  name       = var.postgres.name
  engine     = "pg"
  version    = var.postgres.version
  size       = var.postgres.size
  region     = var.region
  node_count = var.postgres.node_count
  tags       = [var.default_tag]
}

resource "digitalocean_database_db" "querido_diario_db" {
  cluster_id = digitalocean_database_cluster.querido_diario_db_cluster.id
  name = var.postgres.database
}

resource "digitalocean_database_user" "querido_diario_db_user" {
  cluster_id = digitalocean_database_cluster.querido_diario_db_cluster.id
  name = var.postgres.user
}


data "digitalocean_database_cluster" "querido_diario_db_cluster" {
  depends_on = [digitalocean_database_cluster.querido_diario_db_cluster]
  name       = var.postgres.name
}

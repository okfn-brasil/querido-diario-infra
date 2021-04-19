resource "kubernetes_config_map" "querido-diario-db-config" {
  depends_on = [local_file.kubeconfig, kubernetes_namespace.querido-diario]
  metadata {
    name      = "querido-diario-db-config"
    namespace = "querido-diario"
  }

  data = {
    db_uri = "${data.digitalocean_database_cluster.querido-diario-db.private_uri}"
  }
}

resource "kubernetes_config_map" "querido-diario-elasticsearch-config" {
  depends_on = [local_file.kubeconfig, kubernetes_namespace.querido-diario]
  metadata {
    name      = "querido-diario-elasticsearch-config"
    namespace = "querido-diario"
  }

  data = {
    QUERIDO_DIARIO_ELASTICSEARCH_HOST  = ""
    QUERIDO_DIARIO_ELASTICSEARCH_INDEX = ""
  }
}

resource "digitalocean_kubernetes_cluster" "querido-diario" {
  name    = var.cluster_name
  region  = var.region
  version = "1.20.2-do.0"

  node_pool {
    name       = "worker-pool"
    node_count = var.node_count
    size       = var.node_size
    tags       = [var.default_tag]
  }
}

data "digitalocean_kubernetes_cluster" "querido-diario" {
  depends_on = [digitalocean_kubernetes_cluster.querido-diario]
  name       = var.cluster_name
}

resource "local_file" "kubeconfig" {
  depends_on      = [digitalocean_kubernetes_cluster.querido-diario]
  count           = var.write_kubeconfig ? 1 : 0
  content         = data.digitalocean_kubernetes_cluster.querido-diario.kube_config[0].raw_config
  filename        = "${path.root}/kubeconfig"
  file_permission = "664"
}

resource "kubernetes_namespace" "querido-diario" {
  depends_on = [local_file.kubeconfig]
  metadata {
    name = "querido-diario"
  }
}

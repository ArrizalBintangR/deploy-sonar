resource "google_container_cluster" "primary" {
  name = "nexus-cluster"
  location = var.zone

  remove_default_node_pool = true #if not removed, the default node pool will be 2
  initial_node_count = 1
  deletion_protection = false # i put my gke on a temporary server, why bother :D

  depends_on = [ google_project_service.container ]
}

resource "google_container_node_pool" "primary_node" {
  cluster = google_container_cluster.primary.name
  name = "single-node-pool"
  location = var.zone

  node_count = 1

  node_config {
    machine_type = "n1-standard-1"
    preemptible = true

    oauth_scopes = [
      # uses cloud-platform instead of workload-identity because i deploy this on a limited
      # time scope of environment.
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

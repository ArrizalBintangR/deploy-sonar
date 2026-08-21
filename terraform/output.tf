output "bucket_name" {
  value = google_storage_bucket.nexus_blobs.name
}

output "cluster_name" {
  value = google_container_node_pool.primary.name
}

output "cluster_location" {
  value = google_container_node_pool.primary.location
}

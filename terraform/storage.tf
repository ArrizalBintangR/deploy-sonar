resource "google_storage_bucket" "nexus_blobs" {
  name = var.bucket_name
  location = var.region
  storage_class = "STANDARD"

  force_destroy = true
  uniform_bucket_level_access = true

  depends_on = [ google_project_service.storage ]
}

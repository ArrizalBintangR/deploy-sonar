variable "project_id" {
  description = "GCP project ID (Cloud Skills Boost lab project)"
  type = string
}

variable "region" {
  description = "Region for the Cloud Storage Bucket"
  type = string
  default = "us-west1"
}

variable "zone" {
  description = "Zone for the GKE cluster. Zonal (not regional). regional cluster = replicates to 3 node pool by default."
  type = string
  default = "us-west1-a"
}

variable "bucket_name" {
  description = "Globally unique GCS bucket name"
  type = string
}

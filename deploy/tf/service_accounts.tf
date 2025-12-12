resource "google_service_account" "cicd_sa" {
  account_id   = var.cicd_sa_name
  project      = var.project_id
  display_name = "CI/CD Terraform SA"
}

# Cloud Run admin
resource "google_project_iam_member" "run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.cicd_sa.email}"
}

# Artifact Registry admin
resource "google_project_iam_member" "artifact_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.cicd_sa.email}"
}

# Storage admin (pull models, write logs)
resource "google_project_iam_member" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.cicd_sa.email}"
}

# Cloud Build Trigger + Connection Admin
resource "google_project_iam_member" "connection_admin" {
  project = var.project_id
  role    = "roles/cloudbuild.connectionAdmin"
  member  = "serviceAccount:${google_service_account.cicd_sa.email}"
}

# Service Account User
resource "google_project_iam_member" "sa_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.cicd_sa.email}"
}

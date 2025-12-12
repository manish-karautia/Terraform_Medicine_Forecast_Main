# ============================
# 1. Cloud Run deploy trigger
# ============================
resource "google_cloudbuild_trigger" "app_trigger" {
  project         = var.project_id
  location        = var.region
  name            = "deploy-medicine-app"
  service_account = google_service_account.cicd_sa.id

  repository_event_config {
    repository = google_cloudbuildv2_repository.github_repo.id
    push {
      branch = "^main$"
    }
  }

  filename = "deploy/cloudbuild.yaml"

  included_files = [
    "app/**",
    "DockerFile",
    "requirements.txt",
    "run.py"
  ]

  substitutions = {
    _SERVICE_NAME          = var.service_name
    _GAR_REPO              = var.artifact_repo_name
    _CICD_RUNNER_SA_EMAIL  = "${var.cicd_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  }
}

# ============================
# 2. Terraform apply trigger
# ============================
resource "google_cloudbuild_trigger" "infra_trigger" {
  project         = var.project_id
  location        = var.region
  name            = "terraform-apply-infra"
  service_account = google_service_account.cicd_sa.id

  repository_event_config {
    repository = google_cloudbuildv2_repository.github_repo.id
    push {
      branch = "^main$"
    }
  }

  filename = "deploy/cloudbuild-tf.yaml"

  included_files = [
    "deploy/tf/**"
  ]

  substitutions = {
    _TF_STATE_BUCKET       = "${var.project_id}-tfstate"
    _SERVICE_NAME          = var.service_name
    _GAR_REPO              = var.artifact_repo_name
    _CICD_RUNNER_SA_EMAIL  = "${var.cicd_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  }
}

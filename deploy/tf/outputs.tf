output "service_account_email" {
  value = google_service_account.cicd_sa.email
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.repo.repository_id
}

output "github_repo_id" {
  value = google_cloudbuildv2_repository.github_repo.id
}

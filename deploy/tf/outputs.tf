output "service_account_email" {
  value = google_service_account.cicd_sa.email
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.repo.repository_id
}


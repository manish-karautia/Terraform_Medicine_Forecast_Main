variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "service_name" {
  type    = string
  default = "medicine-forecast-service"
}

variable "artifact_repo_name" {
  type    = string
  default = "medicine-forecast"
}

variable "cicd_sa_name" {
  type    = string
  default = "ci-cd-terraform"
}

variable "repository_owner" {
  type = string
}

variable "repository_name" {
  type = string
}

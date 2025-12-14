terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.22.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-tfstate"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

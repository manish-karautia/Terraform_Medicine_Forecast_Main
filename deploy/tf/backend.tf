terraform {
  backend "gcs" {
    bucket = "terraform-tfstate"
  }
}

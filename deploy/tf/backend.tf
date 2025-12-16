terraform {
  backend "gcs" {
    bucket = "terraform1-tfstate"
    
  }
}

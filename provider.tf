provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("account.json")  # Usará o secret do GitHub Actions
}
provider "google" {

  credentials = "${file("./project-hardway-4cb3d3dcac51.json")}"
  project     = "project-hardway"
  region      = "asia-south1"
}

data "google_compute_network" "main" {
  name = "terraform"
}

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}



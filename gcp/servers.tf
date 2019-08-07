resource "google_compute_instance" "server" {
  name         = "server"
  machine_type = "n1-standard-1"
  zone         = "asia-south1-c"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.ubuntu.self_link}"
    }
  }

  tags = ["server"]

  network_interface {
    subnetwork = "public"

    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

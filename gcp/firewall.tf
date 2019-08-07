resource "google_compute_firewall" "firewall" {
  name    = "firewall"
  network = "${data.google_compute_network.main.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "6443"]
  }

  source_tags = ["server"]
}


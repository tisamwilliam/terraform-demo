provider "google" {
  project = "openshift-build-354002"
  region  = "asia-east1"
  zone    = "asia-east1-c"
}

data "google_compute_image" "centos_image" {
  family  = "centos-stream-8"
  project = "centos-cloud"
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_instance" "default" {
  count        = 1

  name         = "terraform-version-control-${count.index}"
  machine_type = "e2-micro"
  zone         = "asia-east2-a"

  network_interface {
    network = "default"
    access_config {
      nat_ip = data.google_compute_address.static.address
    }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}

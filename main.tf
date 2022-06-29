provider "google" {
  project = "openshift-build-354002"
  region  = "asia-east1"
  zone    = "asia-east1-c"
}

resource "google_compute_instance" "default" {
  count        = 1

  name         = "terraform-demo-${count.index}"
  machine_type = "e2-micro"
  zone         = "asia-east2-a"

  network_interface {
    network = "default"

    access_config {
    }
  }

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-8"
    }
  }
}

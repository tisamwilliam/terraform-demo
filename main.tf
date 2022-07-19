provider "google" {
  project = "openshift-build-354002"
}

data "tfe_outputs" "foo" {
  organization = "william-test"
  workspace = "Create-GCP-Instance"
}

resource "google_compute_instance" "default" {
  count        = 1

  name         = "terraform-test-${count.index}"
  machine_type = "e2-micro"
  zone         = "asia-east1-a"

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

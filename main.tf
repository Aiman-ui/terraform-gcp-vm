provider "google" {
  credentials = file("GOOGLE_CREDENTIALS") # The service account JSON file
  project     = var.devsecops-444309                 # Using variable for project ID
  region      = var.region                     # Using variable for region
}

resource "google_compute_instance" "vm_instance" {
  name         = "example-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

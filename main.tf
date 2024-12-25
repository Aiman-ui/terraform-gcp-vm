provider "google" {
  credentials = var.GOOGLE_CREDENTIALS_JSON  
  project     = var.project_id                
  region      = var.region                    
  zone        = var.zone                      
} 
 
resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance-1"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-bullseye-v20210916"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

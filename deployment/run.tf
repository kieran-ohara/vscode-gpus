terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
  }
  backend "local" {}
}

provider "google" {
  project = var.gcp_project_id
  zone    = var.gcp_zone
}

variable "gcp_project_id" {}
variable "gcp_machine_image" {}

variable "gcp_machine_type" {
  type    = string
  default = "n1-standard-4"
}
variable "gcp_gpu_count" {
  type    = number
  default = 0
}
variable "gcp_zone" {
  type    = string
  default = "europe-west4-a"
}

variable "disk_size_gb" {
  type    = number
  default = 20
}

resource "google_compute_disk" "default" {
  name                      = "mlenv-src"
  type                      = "pd-ssd"
  physical_block_size_bytes = 4096
  size                      = var.disk_size_gb
  zone                      = var.gcp_zone
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.id
  instance = google_compute_instance.default.id
}

resource "google_compute_address" "static" {
  name = "mlenv-ipv4-address"
}

resource "google_compute_instance" "default" {
  name         = "mlenv-instance"
  machine_type = var.gcp_machine_type

  boot_disk {
    initialize_params {
      image = var.gcp_machine_image
      size  = 44
    }
  }

  guest_accelerator {
    type  = "nvidia-tesla-t4"
    count = var.gcp_gpu_count
  }
  scheduling {
    on_host_maintenance = "TERMINATE"
  }

  allow_stopping_for_update = true

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    user-data = templatefile("cloud-config.yml", {})
  }
}

output "ipaddress" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

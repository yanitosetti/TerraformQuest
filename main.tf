terraform {
  #task3
  #backend "gcs" { 
  #  bucket = "tf-bucket-874969" 
  #  prefix = "terraform/state" 
  #  }  
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
    source = "./modules/instances"
}

module "storage" {
    source = "./modules/storage"
}

#Task6
#module "network" {
#  source  = "terraform-google-modules/network/google"
#  version = "3.4.0"
  # insert the 3 required variables here
#  project_id   = var.project_id
#  network_name = ""
#  routing_mode = "GLOBAL"
#  subnets = [
#    {
#        subnet_name           = "subnet-01"
#        subnet_ip             = "10.10.10.0/24"
#        subnet_region         = "us-central1"
#    },
#    {
#        subnet_name           = "subnet-02"
#        subnet_ip             = "10.10.20.0/24"
#        subnet_region         = "us-central1"
#    }
#  ]
#}

#Task7
#resource "google_compute_firewall" "tf-firewall" {
#  name    = "tf-firewall"
#  network = "projects/<PROJECT_ID>/global/networks/<NETWORK_NAME>"
#  allow {
#    protocol = "tcp"
#    ports    = ["80"]
#  }
#  source_ranges = ["0.0.0.0/0"] 
#}

provider "google" {
    version     = "~> 2.2"
    credentials = "${file("../../ssl/account.json")}"
    project     = "${var.project_id}"
    region      = "${var.region}"
    zone        = "${var.zone}"
}

resource "google_compute_instance" "slave1_instance" {
  name         = "${var.slave1_name}"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      image = "${var.slave_image}"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }

  metadata_startup_script = "/home/ubuntu/slave.sh"

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.read",
      "https://www.googleapis.com/auth/logging.write",
    ]
  }
}

resource "google_compute_instance" "slave2_instance" {
  name         = "${var.slave2_name}"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      image = "${var.slave_image}"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }

  metadata_startup_script = "/home/ubuntu/slave.sh"

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.read",
      "https://www.googleapis.com/auth/logging.write",
    ]
  }
}

output "slave1_ip" {
 value = "${google_compute_instance.slave1_instance.network_interface.0.access_config.0.nat_ip}"
}

output "slave2_ip" {
 value = "${google_compute_instance.slave2_instance.network_interface.0.access_config.0.nat_ip}"
}

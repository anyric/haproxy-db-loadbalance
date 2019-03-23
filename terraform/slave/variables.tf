variable "project_id" {
  type = "string"
  default = "andela-learning"
}
variable "region" {
  type = "string"
  default = "europe-west1"
}
variable "zone" {
  type = "string"
  default = "europe-west1-b"
}
variable "slave_image" {
  type    = "string"
  default = "ubuntu-1604-xenial-v20170815a"
}

variable "machine_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "slave1_name" {
  type    = "string"
  default = "anyric-slave1-instance"
}

variable "slave2_name" {
  type    = "string"
  default = "anyric-slave2-instance"
}

resource "google_compute_address" "slave1_static_ip" {
  name = "ipv4-address"
}
resource "google_compute_address" "slave2_static_ip" {
  name = "ipv4-address"
}

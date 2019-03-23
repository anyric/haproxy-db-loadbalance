variable "project_id" {
  type = "string"
}
variable "region" {
  type = "string"
}
variable "zone" {
  type = "string"
}
variable "slave_image" {
  type    = "string"
  default = "slave-base-image"
}

variable "machine_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "slave1_name" {
  type    = "string"
  default = "slave1-server"
}

variable "slave2_name" {
  type    = "string"
  default = "slave2-server"
}

resource "google_compute_address" "slave1_static_ip" {
  name = "ipv4-address"
}
resource "google_compute_address" "slave2_static_ip" {
  name = "ipv4-address"
}

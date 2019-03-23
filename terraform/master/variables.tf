variable "project_id" {
  type = "string"
}
variable "region" {
  type = "string"
}
variable "zone" {
  type = "string"
}
variable "master_image" {
  type    = "string"
  default = "master-base-image"
}

variable "machine_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "master_name" {
  type    = "string"
  default = "master-server"
}

resource "google_compute_address" "master_static_ip" {
  name = "ipv4-address"
}
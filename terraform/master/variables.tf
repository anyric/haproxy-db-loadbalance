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
  default = "ubuntu-1604-xenial-v20170815a"
}

variable "machine_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "master_name" {
  type    = "string"
}

resource "google_compute_address" "master_static_ip" {
  name = "ipv4-address"
}
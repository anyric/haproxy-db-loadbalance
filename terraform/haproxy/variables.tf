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
variable "haproxy_image" {
  type    = "string"
  default = "ubuntu-1604-xenial-v20170815a"
}

variable "machine_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "haproxy_name" {
  type    = "string"
  default = "anyric-haproxy-instance"
}

resource "google_compute_address" "haproxy_static_ip" {
  name = "ipv4-address"
}
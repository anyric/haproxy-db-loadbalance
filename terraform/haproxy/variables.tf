variable "project_id" {
  type = "string"
}
variable "region" {
  type = "string"
}
variable "zone" {
  type = "string"
}
variable "haproxy_image" {
  type    = "string"
  default = "haproxy-base-image"
}

variable "machine_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "haproxy_name" {
  type    = "string"
  default = "haproxy-server"
}

resource "google_compute_address" "haproxy_static_ip" {
  name = "ipv4-address"
}
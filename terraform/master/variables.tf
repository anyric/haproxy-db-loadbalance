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
  default = "anyric-master-instance"
}

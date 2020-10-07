# AWS region
variable "region" {
  default = "ap-southeast-2"
}

variable "shared_credentials" {
  default = "/home/william/.aws/credentials"
}

variable "profile" {
  default = "default"
}

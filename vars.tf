variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-0b5eea76982371e91"
    us-east-1 = "ami-0b5eea76982371e91"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "terra-key.pub"
}

variable "PRIV_KEY" {
  default = "terra-key"
}

variable "MYIP" {
  default = "43.23.20.124/32"
}

variable "region" {
  default = "ap-southeast-2"
}

variable "cluster_name" {
  default = "flask-app-cluster"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_nodes" {
  default = 2
}

variable "ami" {
  default = "ami-0312bcacbe51d03c8" # Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
}

variable "instance_type" {
  default = "t2.micro"
}
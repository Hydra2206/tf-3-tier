variable "vpc_cidr" {
}

variable "vpc_name" {
  
}

variable "region" {
  
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "private_subnets" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "repo_name" {
  type    = list(string)
}


variable "cluster_name" {
  
}

variable "node_group_name" {
  
}

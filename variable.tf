variable "env" {
  description ="This is the environment for my infrastructure-app"
  type = string
}

variable "bucket_name" {
  description = "My bucket name for my infrastructure-app"
  type = string
}

variable "instance_count"  {

description = "This is the number of ec2 instance of my infrastructure-app"
type = number 
}


variable "instance_type"  {

description = "This is the instance type of my insfrastructure-app"
type = string
}


variable "ec2_ami_id"  {

description = "This is the instance ami_id of my insfrastructure-app"
type = string
}


variable "hash_key"  {

description = "This is the hash key of my infrastructure app table"
type = string
}
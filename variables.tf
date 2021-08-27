variable "instances_count" {
  description = "Nodes count"
  default = 1
}

variable "private_subnet" {
  description = "subnet id"
  default     = "subnet-046dd081714a01fe6"
}

variable "public_subnet" {
  description = "subnet id"
  default     = "subnet-0b15f4869352d47f6"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_type_apigw" {
  default = "t2.small"
}

variable "ec2_sg_group" {
  type        = list(string)
  description = "Security group for instance"
  default     = ["sg-07aa3c5e0d03578d8", "sg-01a724d616e025f10"]
}

variable "env_name" {
}

variable "root_volume_type" {
  default = "gp2"
}

variable "root_volume_size" {
  default = 15
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

variable "key_name" {
  default = "voxxify-ml"
}

variable "vpc_id" {
  default = "vpc-02f37e770adedc2c5"
}

variable "asg_max" {
  default = "1"
}

variable "asg_min" {
  default = "1"
}

variable "asg_grace" {
  default = "300"
}

variable "asg_hct" {
  default = "EC2"
}

variable "asg_cap" {
  default = "1"
}
# AWS Regions / Zones

variable "aws_region" {
  type        = string
  description = "AWS region which should be used"
  default     = "ap-northeast-1"
}

variable "aws_zones" {
  type        = list(any)
  description = "AWS AZs (Availability zones) where subnets should be created"
}

# Private subnets

variable "private_subnets" {
  description = "Create both private and public subnets"
  type        = string
  default     = "false"
}

# Resource naming

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# Network details (Change this only if you know what you are doing or if you think you are lucky)

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC"
}

variable "cluster_name" {
  description = "Name of the AWS Minikube cluster - will be used to name all created resources"
}

variable "tags" {
  description = "Tags used for the AWS resources created by this template"
  type        = map(string)
}

variable "addons" {
  description = "list of YAML files with Kubernetes addons which should be installed"
  type        = list(string)
}

variable "aws_instance_type" {
  description = "Type of instance"
  default     = "t2.medium"
}

variable "ssh_public_key" {
  description = "Path to the pulic part of SSH key which should be used for the instance"
  default     = "~/.ssh/id_rsa.pub"
}

variable "hosted_zone" {
  description = "Hosted zone to be used for the alias"
  default     = ""
}

variable "hosted_zone_private" {
  description = "Is the hosted zone public or private"
  default     = false
}

variable "ami_image_id" {
  description = "ID of the AMI image which should be used. If empty, the latest CentOS 7 image will be used. See README.md for AMI image requirements."
  default     = ""
}


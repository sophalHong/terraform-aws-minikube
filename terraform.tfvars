### AWS VPC setting
aws_region      = "ap-northeast-1"
aws_zones       = ["ap-northeast-1a"]
vpc_name        = "minikube-vpc"
vpc_cidr        = "10.0.0.0/16"
private_subnets = "false"

### EC2 instance setting
cluster_name = "my-minikube"
aws_instance_type = "t2.medium"
ssh_private_key = "~/.ssh/id_rsa"
ssh_public_key = "~/.ssh/id_rsa.pub"
#hosted_zone         = "example.com"
ami_image_id = "ami-063c5a5e375b71d95" # Centos Linux 8.4.2105
tags = {
  Application = "Minikube"
}
addons = [
  "https://raw.githubusercontent.com/sophalHong/terraform-aws-minikube/master/modules/minikube/addons/storage-class.yaml",
  "https://raw.githubusercontent.com/sophalHong/terraform-aws-minikube/master/modules/minikube/addons/metrics-server.yaml",
  "https://raw.githubusercontent.com/sophalHong/terraform-aws-minikube/master/modules/minikube/addons/dashboard.yaml",
  "https://raw.githubusercontent.com/sophalHong/terraform-aws-minikube/master/modules/minikube/addons/external-dns.yaml"
]

# Amazon AWS Minikube

This Terraform configuration creates:
* Amazon AWS VPC
* Internet Gateway
* Subnets in all configured availability zones and routing tables linking them to the Internet Gateway
* Amazon EC2 instance
* Execute cloud-init/user_data to run single node Kubernetes cluster installation

Additionally, if variable `private_subnets` is set to true, it will create:

* NAT with Elastic IP address in each availability zone
* Private subnet in each availability zone with routing tables linking them to the NAT

<!-- TOC -->

- [Amazon AWS VPC](#amazon-aws-vpc)
    - [Prerequisites and dependencies](#prerequisites-and-dependencies)
    - [Configuration](#configuration)
    - [Creating the VPC](#creating-the-aws-minikube)
    - [Deleting the VPC](#deleting-the-aws-minikube)

<!-- /TOC -->

## Prerequisites and dependencies

There are no other dependencies apart from [Terraform](https://www.terraform.io).

## Configuration

| Option | Explanation | Example |
|--------|-------------|---------|
| `aws_region` | AWS region which should be used | `eu-central-1` |
| `aws_zones` | List of AWS availability zones which should be used | `["eu-central-1a", "eu-central-1b"]` |
| `vpc_name` | Name of the VPC which should ve created | `my-vpc` |
| `vpc_cidr` | CIDR address which should be used | `10.0.0.0/16` |
| `private_subnets` | Create also private subnets with NAT in every avaialbility zone | `false` or `true` |
| `cluster_name` | Name of the AWS Minikube cluster | "my-minikube" |
| `aws_instance_type` | Type of EC2 Instance | "t2.medium" |
| `ssh_public_key` | Path to the pulic part of SSH key, used for the instance | "~/.ssh/id_rsa.pub" |
| `hosted_zone` | Hosted zone to be used for the alias domain name | "example.com" or "" |
| `ami_image_id` | ID of the AMI image. If empty, default Centos 7 image is used | "ami-063c5a5e375b71d95" |
| `tags` | Tags which should be applied to all resources | `{ Application = "Minikube" }` |
| `addons` | List of YAML file urls with Kubernetes addons to be installed | ["https://.../dashboard.yaml] |

## Creating the AWS Minikube

To create the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Apply Terraform configuration:
```bash
terraform init
terraform apply
# terraform apply -auto-approve
```

## Deleting the AWS Minikube

To delete the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Destroy Terraform configuration:
```bash
terraform destroy
```

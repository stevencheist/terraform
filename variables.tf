# AWS Credential
#variable "access_key" {
#    decscription = "AWS Access Key"
#}
#variable "secret_key" {
#    description = "AWS Secret Key"
#}

# AWS Region and Availablility Zone
variable "region" {
    default = "us-east-1"
}

variable "availability_zone" {
    default = "us-east-1e"
}

# VPC configuration
variable "vpc_cidr_block" {
    default = "10.88.0.0/16"
}

variable "vpc_instance_tenancy" {
    default = "default"
}

variable "vpc_name" {
    default = "PAVM VPC"
}

# Management subnet configuration
variable "mgmt_subnet_cidr_block" {
    default = "10.88.0.0/24"
}

# Untrust subnet configuration
variable "untrust_subnet_cidr_block" {
    default = "10.88.1.0/24"
}

# Trust subnet configuration
variable "trust_subnet_cidr_block" {
    default = "10.88.66.0/24"
}

# PAVM configuration
variable "pavm_payg_bun2_ami_id" {
    default = {
        eu-west-1 = "ami-5d92132e",
        ap-southeast-1 = "ami-946da7f7",
        ap-southeast-2 = "ami-d7c6e5b4",
        ap-northeast-2 = "ami-fb08c195",
        eu-central-1 = "ami-8be001e4",
        ap-northeast-1 = "ami-b84b5ad6",
        us-east-1 = "ami-7dcb9906",
        us-west-1 = "ami-12d0ad72",
        sa-east-1 = "ami-19810e75",
        us-west-2 = "ami-e4be4b84"
    }
}

variable "pavm_byol_ami_id" {
    default = {
        ap-south-1 = "ami-5c187233",
        eu-west-1 = "ami-73971600",
        ap-southeast-1 = "ami-0c60aa6f",
        ap-southeast-2 = "ami-f9c4e79a",
        ap-northeast-2 = "ami-fa08c194",
        eu-central-1 = "ami-74e5041b",
        ap-northeast-1 = "ami-e44b5a8a",
        us-east-1 = "ami-7dcb9906",
        us-west-1 = "ami-acd7aacc",
        sa-east-1 = "ami-1d860971",
        us-west-2 = "ami-e7be4b87"
    }
}

variable "pavm_instance_type" {
    default = "m3.xlarge"
}

variable "pavm_key_name" {
    description = "Name of the SSH keypair to use in AWS."
    default = "aws"
}

variable "pavm_key_path" {
    description = "Path to the private portion of the SSH key specified."
    default = "./"
}

variable "pavm_public_ip" {
    default = "true"
}

variable "pavm_mgmt_private_ip" {
    default = "10.88.0.200"
}

variable "pavm_untrust_private_ip" {
    default = "10.88.1.210"
}

variable "pavm_trust_private_ip" {
    default = "10.88.66.220"
}

variable "pavm_user_data" {
    default = "vmseries-bootstrap-aws-s3bucket=panw-mlue-bucket"
    #default = ""
}

variable "pavm_iam_instance_profile" {
    #	default = ""
	default = "pa_bootstrap_s3_readonly"
}

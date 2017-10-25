# Create VPC
resource "aws_vpc" "pavm-vpc" {
    cidr_block = "${var.vpc_cidr_block}"
    enable_dns_support = true # needed to enable bootstrap and to resolve EIPs
    enable_dns_hostnames = false
    instance_tenancy = "${var.vpc_instance_tenancy}"
    tags {
        Name = "${var.vpc_name}"
    }
}


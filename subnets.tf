# Create Management subnet
resource "aws_subnet" "mgmt-subnet" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    cidr_block = "${var.mgmt_subnet_cidr_block}"
    availability_zone = "${var.availability_zone}"
    map_public_ip_on_launch = false
    tags {
        Name = "mgmt-subnet"
    }
}

# Create Untrust subnet
resource "aws_subnet" "untrust-subnet" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    cidr_block = "${var.untrust_subnet_cidr_block}"
    availability_zone = "${var.availability_zone}"
    map_public_ip_on_launch = true
    tags {
        Name = "untrust-subnet"
    }
}

# Create Trust subnet
resource "aws_subnet" "trust-subnet" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    cidr_block = "${var.trust_subnet_cidr_block}"
    availability_zone = "${var.availability_zone}"
    map_public_ip_on_launch = false
    tags {
        Name = "trust-subnet"
    }
}


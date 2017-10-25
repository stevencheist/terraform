# Create default VPC Network ACL
resource "aws_network_acl" "default-network-acl" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    egress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
	#replace with your subnet or specific IP address... otherwise you are permitting all.
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
	#replace with your subnet or specific IP address... otherwise you are permitting all.
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    egress {
        protocol = "-1"
        rule_no = 101
        action = "allow"
	#replace with your subnet or specific IP address... otherwise you are permitting all.
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 101
        action = "allow"
	#replace with your subnet or specific IP address... otherwise you are permitting all.
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    subnet_ids = [
        "${aws_subnet.mgmt-subnet.id}",
        "${aws_subnet.untrust-subnet.id}",
        "${aws_subnet.trust-subnet.id}"
    ]
    tags {
        Name = "access list"
    }
}
/* Create default VPC security group */
resource "aws_security_group" "default-security-gp" {
    name = "pavm-allow-all"
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    description = "Allow all inbound traffic"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
	#replace with your subnet or specific IP address... otherwise you are permitting all.
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
	#replace with your subnet or specific IP address... otherwise you are permitting all.
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "pavm-allow-all"
    }
}


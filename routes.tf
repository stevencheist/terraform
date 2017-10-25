# Create Management route table
resource "aws_route_table" "mgmt-routetable" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    tags {
        Name = "mgmt-routetable"
    }
}

/* */
# Create default route for Management route table
resource "aws_route" "mgmt-default-route" {
    route_table_id = "${aws_route_table.mgmt-routetable.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.pavm-igw.id}"
    depends_on = [
        "aws_route_table.mgmt-routetable",
        "aws_internet_gateway.pavm-igw"
    ]
}

# Associate Management route table to Management subnet
resource "aws_route_table_association" "mgmt-routetable-association" {
    subnet_id = "${aws_subnet.mgmt-subnet.id}"
    route_table_id = "${aws_route_table.mgmt-routetable.id}"
}

# Create Untrust route table
resource "aws_route_table" "untrust-routetable" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    tags {
        Name = "untrust-routetable"
    }
}
# Create default route for Untrust route table
resource "aws_route" "untrust-default-route" {
    route_table_id = "${aws_route_table.untrust-routetable.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.pavm-igw.id}"
    depends_on = [
        "aws_route_table.untrust-routetable",
        "aws_internet_gateway.pavm-igw"
    ]
}

# Associate Untrust route table to Untrust subnet
resource "aws_route_table_association" "untrust-routetable-association" {
    subnet_id = "${aws_subnet.untrust-subnet.id}"
    route_table_id = "${aws_route_table.untrust-routetable.id}"
}

# Create Trust route table
resource "aws_route_table" "trust-routetable" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    tags {
        Name = "trust-routetable"
    }
}
# Create default route for Trust route table
resource "aws_route" "trust-default-route"{
	route_table_id = "${aws_route_table.trust-routetable.id}"
	destination_cidr_block = "0.0.0.0/0"
	instance_id = "${aws_instance.pavm.id}"
	#aws_network_interface = "${aws_network_interface.trust_eni.private_ips}"
	depends_on = [
		"aws_route_table.trust-routetable",
	]
}

# Associate Trust route table to Trust subnet
resource "aws_route_table_association" "trust-routetable-association" {
    subnet_id = "${aws_subnet.trust-subnet.id}"
    route_table_id = "${aws_route_table.trust-routetable.id}"
}



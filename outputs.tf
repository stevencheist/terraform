# Output data
output "vpc-VPC-ID" {
    value = "${aws_vpc.pavm-vpc.id}"
}

output "subnet-Management-Subnet-ID" {
    value = "${aws_subnet.mgmt-subnet.id}"
}
output "vpc-Default-Security-Group-ID" {
    value = "${aws_security_group.default-security-gp.id}"
}



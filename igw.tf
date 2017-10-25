# Create VPC Internet Gateway
resource "aws_internet_gateway" "pavm-igw" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    tags {
        Name = "pavm-igw"
    }
}


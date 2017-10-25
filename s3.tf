# Create an endpoint for S3 bucket
/*  Uncomment to enable */
resource "aws_vpc_endpoint" "private-s3" {
    vpc_id = "${aws_vpc.pavm-vpc.id}"
    service_name = "com.amazonaws.us-east-1.s3"
    
    #  Uncomment to enable policy
    policy = <<POLICY
    {
        "Statement": [
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::ha1-dev-paloalto/*"
        }
    ]
    }
    POLICY
   

    route_table_ids = [
        "${aws_route_table.mgmt-routetable.id}"
        #"${aws_route_table.trust-routetable.id}"
    ]
}


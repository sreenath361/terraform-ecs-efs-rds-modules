resource "aws_security_group" "demo-vpc-security-group" {
    name        = "demo-vpc-security-group"
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id = "${aws_vpc.demo-vpc.id}"


    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    # SSH
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "security-group-id" {
  value = "${aws_security_group.demo-vpc-security-group.id}"
}

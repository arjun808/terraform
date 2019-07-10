resource "aws_security_group" "jenkins" {
  name        = "jenkins"
  description = "Allow traffic for jenkins"
  vpc_id      = "${data.aws_vpc.main.id}"

  ingress {
  //this opens all ports. just for testing
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
  #description = "checkov test"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

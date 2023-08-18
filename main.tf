provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_block
  }
}

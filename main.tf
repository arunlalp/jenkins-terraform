provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
}

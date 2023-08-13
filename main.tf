provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myFirstInstance" {
  ami                    = var.ami_id
  key_name               = var.key_name
  instance_type          = var.instance_type
  tags= {
    Name = var.tag_name
  }
}

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-2"
}

variable "from_port" {
  type        = number
  default     = 22
  description = "List of starting ports for cidr ingress rules of the EC2 security group."
}

variable "to_port" {
  type        = number
  default     = 22
  description = "List of ending ports for cidr ingress rules of the EC2 security group."
}

variable "protocol" {
  type        = string
  default     = "tcp"
  description = "List of protocols for cidr ingress rules of the EC2 security group."
}

variable "cidr_block" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks for cidr ingress rules of the EC2 security group."
}

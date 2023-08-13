variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "us-west-2" 
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t2.micro" 
}

variable "ami_id" { 
    description = "AMI for Ubuntu Ec2 instance" 
    default     = "ami-0ee23bfc74a881de5" 
}

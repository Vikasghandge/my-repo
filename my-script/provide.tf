provider "aws" {
    region = "ap-south-1"
  
}
# aws resources 

resource "aws_instance" "my-test" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.mirco"
    key_name = "devops-key"
  
}
  
# tagging
tags = {
    
}

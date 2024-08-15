resource "aws" "ec2" {
    ami =  ""
    instance_type = "t2.micro"
    
  
}
tags = {
    name = {testing sever}
}
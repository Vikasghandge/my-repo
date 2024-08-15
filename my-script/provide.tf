provider "aws" {
    region = "ap-south-1"
  
}
# aws resources 

resource "aws_instance" "my-test" {
    ami = ""
    instance_type = "t2.mirco"
    key_name = "devops-key"
  
}
  
}

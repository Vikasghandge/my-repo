resource "aws_instance" "my" {
    ami =  "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    keyname = "devops-key"
}


  

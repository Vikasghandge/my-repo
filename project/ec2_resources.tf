# Public subnet EC2 instance 1
resource "aws_instance" "two-tier-web-server-1" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id     = aws_subnet.two-tier-pub-sub-1.id
  key_name      = "two-tier-key"

  tags = {
    Name = "two-tier-web-server-1"
  }

  user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}

# Public subnet EC2 instance 2
resource "aws_instance" "two-tier-web-server-2" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id     = aws_subnet.two-tier-pub-sub-2.id
  key_name      = "two-tier-key"

  tags = {
    Name = "two-tier-web-server-2"
  }

  user_data = <<-EOF
#!/bash/bin
sudo apt update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}

# Allocate Elastic IPs (EIPs) for EC2 instances
resource "aws_eip" "two-tier-web-server-1-eip" {
  domain = "vpc"

  instance   = aws_instance.two-tier-web-server-1.id
  depends_on = [aws_internet_gateway.two-tier-igw]
}

resource "aws_eip" "two-tier-web-server-2-eip" {
  domain = "vpc"

  instance   = aws_instance.two-tier-web-server-2.id
  depends_on = [aws_internet_gateway.two-tier-igw]
}



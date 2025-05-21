variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}
variable "ami_ids" {
  description = "Map of AMIs by region"
  type        = map(string)
  default = {
    "us-east-1" = "ami-0953476d60561c955"
    "us-east-2" = "ami-06c8f2ec674c67112"
  }
}
resource "aws_instance" "nginx_instance_1" {
  provider      = aws.east1
  ami           = var.ami_ids["us-east-1"]
  instance_type = var.instance_type
  user_data     = <<-EOF
                #!/bin/bash 
                sudo yum update -y 
                sudo amazon-linux-extras install nginx1 -y 
                sudo systemctl start nginx 
                sudo systemctl enable nginx
                EOF
  tags = {
    Name = "NginxEngine01"
  }
}
resource "aws_instance" "nginx_instance_2" {
  provider      = aws.east2
  ami           = var.ami_ids["us-east-2"]
  instance_type = var.instance_type
  user_data     = <<-EOF
                #!/bin/bash 
                sudo yum update -y 
                sudo amazon-linux-extras install nginx1 -y 
                sudo systemctl start nginx 
                sudo systemctl enable nginx
                EOF
  tags = {
    Name = "NginxEngine02"
  }
}

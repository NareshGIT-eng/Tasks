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
resource "aws_instance" "linux_instance_us-east-1" {
  provider      = aws.east1
  ami           = var.ami_ids["us-east-1"]
  instance_type = var.instance_type
  tags = {
    Name = "Linux US East1"
  }
}
resource "aws_instance" "linux_instance_us-east-2" {
  provider      = aws.east2
  ami           = var.ami_ids["us-east-2"]
  instance_type = var.instance_type
  tags = {
    Name = "Linux US East2"
  }
}

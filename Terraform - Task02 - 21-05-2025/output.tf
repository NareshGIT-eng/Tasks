output "nginx_instance_1_ip" {
  value = aws_instance.nginx_instance_1.public_ip
}
output "nginx_instance_2_ip" {
  value = aws_instance.nginx_instance_2.public_ip
}


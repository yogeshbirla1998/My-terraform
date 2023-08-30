output "private_ips" {

  description = "Private IP addresses of the EC2 instances"

  value = aws_instance.priv_instance[*].private_ip

}

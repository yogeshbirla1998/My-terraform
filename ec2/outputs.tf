output "instance_private_ip" {
  value = aws_instance.priv-instance.private_ip
}
output "public_ips" {
  description = "Public IP addresses of the Jump-Box instance"
  value       = aws_instance.public_instance.public_ip
}

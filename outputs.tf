output "website_url" {
  value = "http://${module.ec2.public_ip}"
}
output "ec2_private_key" {
  value     = tls_private_key.ec2.private_key_pem
  sensitive = true
}
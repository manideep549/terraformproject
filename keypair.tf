/**resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ec2" {
  key_name   = "tf-generated-key-v2"
  public_key = tls_private_key.ec2.public_key_openssh
} **/
resource "tls_private_key" "ec2" {
  count     = var.create_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2" {
  count      = var.create_key ? 1 : 0
  key_name   = "tf-generated-key"
  public_key = tls_private_key.ec2[0].public_key_openssh
}

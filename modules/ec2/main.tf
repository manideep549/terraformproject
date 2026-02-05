resource "aws_instance" "web" {
  ami                    = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (ap-south-1)
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Terraform Web App is Live 🚀</h1>" > /var/www/html/index.html
              EOF

  tags = { Name = "tf-web-ec2" }
}

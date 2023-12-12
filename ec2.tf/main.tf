resource "aws_instance" "name" {
  count                       = var.number_of_instance
  ami                         = var.ami
  instance_type               = var.instance_type[1]
   associate_public_ip_address = var.associate_public_ip_address
  tags = var.tags
}


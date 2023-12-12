resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block

  tags = var.vpc_tags  

}
resource "aws_subnet" "priv_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.priv_sub_cidr_block
   availability_zone = var.availability_zone_cidr_block

  tags = var.priv_sub_name
}

resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_sub_cidr_block

  tags = var.pub_sub_name
}

resource "aws_route_table" "priv_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.priv_sub_cidr_block
  }

  tags = var.priv_sub_rt_name
}

resource "aws_route_table_association" "rt_ass" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.priv_rt.id
}


resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.pub_sub_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.priv_sub_rt_name
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = var.igw_name
}









































# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_route_table" "rt" {
#   vpc_id = aws_vpc.main.id
#   route = []
#   tags = {
#     Name = "rt"
#   }
# }

# # Create public subnet
# resource "aws_subnet" "public_subnet" {
#   vpc_id = aws_vpc.main.id
#   cidr_block = "10.0.1.0/16"
#   availability_zone = "us-est-1"
#   tags = {
#     Name = "public-subnet"
#   }
# }

# # Create private subnet
# resource "aws_subnet" "private_subnet" {
#   vpc_id = aws_vpc.main.id
#   cidr_block = "10.0.2.0/16"
#   availability_zone = "us-east-1"
#   tags = {
#     Name = "private-subnet"
#   }
# }
# # Create internet gateway
# resource "aws_internet_gateway" "my_igw" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "my-igw"
#   }
# }

# # Attach internet gateway to VPC
# resource "aws_vpc_attachment" "my_igw_attachment" {
#   vpc_id = aws_vpc.main.id
#   internet_gateway_id = aws_internet_gateway.my_igw.id
# }
# # Create route table
# resource "aws_route_table" "my_route_table" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "my-route-table"
#   }
# }
# # Create public route
# resource "aws_route" "public_route" {
#   route_table_id = aws_route_table.my_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.my_igw.id
# }
# # Associate public subnet with route table
# resource "aws_route_table_association" "public_subnet_association" {
#   subnet_id = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.my_route_table.id
# }

# # Create security group for SSH and HTTP traffic
# resource "aws_security_group" "my_security_group" {
#   name_prefix = "my-security-group"
#   description = "My security group"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = [aws_vpc.main.cidr_block]                             #var.ssh_cidr_blocks
#   }
# }

#   ingress {
#     from_port = 80
#     to_port = 80
#   }


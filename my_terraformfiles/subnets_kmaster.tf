# This config file will create the subnets for all the kmaster server

# Creating public subnet for kmaster server
resource "aws_subnet" "kmaster_subnets_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-kmasterPb
  map_public_ip_on_launch = true
  tags = {
    Name = var.kmaster-subnetPb-name
  }
}

# Creating the private subnet for kmaster server
resource "aws_subnet" "kmaster_subnets_private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-kmasterPr
  map_public_ip_on_launch = true
  tags = {
    Name = var.kmaster-subnetPr-name
  }
}

# Creating the public route table for kmaster Subnet
resource "aws_route_table" "kmaster_pubSubnet_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.anywhere_ip
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = var.public-rt-nameKM
  }
}


# Associating the kmaster public subnet to the kmaster public route table
resource "aws_route_table_association" "kmasterPb_assoc" {
  subnet_id      = aws_subnet.kmaster_subnets_public.id
  route_table_id = aws_route_table.kmaster_pubSubnet_rt.id
}

# Associating the kmaster private subnet to the kmaster private route table
# resource "aws_route_table_association" "kmasterPr_assoc" {
#   subnet_id      = aws_subnet.kmaster_subnets_private.id
#   route_table_id = aws_route_table.kmaster_prSubnet_rt.id
# }
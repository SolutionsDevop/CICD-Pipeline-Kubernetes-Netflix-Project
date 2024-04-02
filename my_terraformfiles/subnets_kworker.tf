# This config file will create the subnets for all the kworker server

# Creating public subnet for kworker server
resource "aws_subnet" "kworker_subnets_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-kworkerPb
  map_public_ip_on_launch = true
  tags = {
    Name = var.kworker-subnetPb-name
  }
}

# Creating the private subnet for kworker server
resource "aws_subnet" "kworker_subnets_private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-kworkerPr
  map_public_ip_on_launch = true
  tags = {
    Name = var.kworker-subnetPr-name
  }
}

# Creating the public route table for Jenkins Subnet
resource "aws_route_table" "kworker_pubSubnet_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.anywhere_ip
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = var.public-rt-nameKW
  }
}

# Associating the jenkins public subnet to the jenkins public route table
resource "aws_route_table_association" "kworker_assoc" {
  subnet_id      = aws_subnet.kworker_subnets_public.id
  route_table_id = aws_route_table.kworker_pubSubnet_rt.id
}
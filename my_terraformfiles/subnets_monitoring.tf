# This config file will create the subnets for all the monitoring server

# Creating public subnet for monitoring server
resource "aws_subnet" "monitoring_subnets_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-monitoringPb
  map_public_ip_on_launch = true
  tags = {
    Name = var.monitoring-subnetPb-name
  }
}

# Creating the private subnet for monitoring server
resource "aws_subnet" "monitoring_subnets_private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-monitoringPr
  map_public_ip_on_launch = true
  tags = {
    Name = var.monitoring-subnetPr-name
  }
}

# Creating the public route table for monitoring Server
resource "aws_route_table" "monitoring_pubSubnet_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.anywhere_ip
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = var.public-rt-nameM
  }
}

# Associating the monitoring public subnet to the jenkins public route table
resource "aws_route_table_association" "monitoring_assoc" {
  subnet_id      = aws_subnet.monitoring_subnets_public.id
  route_table_id = aws_route_table.monitoring_pubSubnet_rt.id
}
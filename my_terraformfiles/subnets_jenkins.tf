# This config file will create the subnets for all the jenkins server

# Creating public subnet for jenkins server
resource "aws_subnet" "jenkins_subnets_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-jenkinsPb
  map_public_ip_on_launch = true
  tags = {
    Name = var.jenkins-subnetPb-name
  }
}

# Creating the private subnet for Jenkins server
resource "aws_subnet" "jenkins_subnets_private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet-cidr-jenkinsPr
  map_public_ip_on_launch = true
  tags = {
    Name = var.jenkins-subnetPr-name
  }
}

# Creating the public route table for Jenkins Subnet
resource "aws_route_table" "jenkins_pubSubnet_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.anywhere_ip
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = var.public-rt-nameJ
  }
}

# Associating the jenkins public subnet to the jenkins public route table
resource "aws_route_table_association" "jenkins_assoc" {
  subnet_id      = aws_subnet.jenkins_subnets_public.id
  route_table_id = aws_route_table.jenkins_pubSubnet_rt.id
}
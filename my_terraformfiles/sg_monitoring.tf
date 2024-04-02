# this config file is creating security group for jenkins server
resource "aws_security_group" "sg_monitoring" {
  name        = "Allow all required security group for Monitoring server"
  description = "Allow all the traffic listed on the variable file for Monitoring sg"
  vpc_id      = aws_vpc.vpc.id
  dynamic "ingress" {
    iterator = port
    for_each = var.monitoringingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.monitoring_server_sg_name
  }

}
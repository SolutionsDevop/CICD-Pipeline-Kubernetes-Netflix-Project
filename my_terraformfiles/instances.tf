# This config file will create the ec2 instance for Jenkins, monitoring, and the k8s servers

# Jenkins server instance
resource "aws_instance" "jenkins_instance" {
  #count           = 1
  ami             = var.image_id
  instance_type   = var.instance_type[1]
  subnet_id       = aws_subnet.jenkins_subnets_public.id
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.sg_jenkins.id] # If the subnet is associated you cannot use the name but the sg id
  root_block_device {
    volume_size           = "35"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
    tags = {
      Name = "ebs_jenkins"
    }
  }
  # ebs_block_device {
  #   device_name           = "/dev/xvda"
  #   volume_size           = 35
  #   volume_type           = "sdh"
  #   encrypted             = true
  #   delete_on_termination = true
  # }

  tags = {
    Name = var.jenkins_server_name
  }
}

# Monitoring server instance
resource "aws_instance" "monitoring_instance" {
  #count           = 1
  ami             = var.image_id
  instance_type   = var.instance_type[0]
  subnet_id       = aws_subnet.monitoring_subnets_public.id
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.sg_monitoring.id]
  root_block_device {
    volume_size           = "15"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
    tags = {
      Name = "ebs_monitoring"
    }
  }
  # ebs_block_device {
  #   device_name           = "/dev/sdh"
  #   volume_size           = 15
  #   volume_type           = "gp3"
  #   encrypted             = true
  #   delete_on_termination = true
  # }

  tags = {
    Name = var.monitoring_server_name
  }
}

# Kmaster server instance
resource "aws_instance" "kmaster_instance" {
  #count           = 1
  ami             = var.image_id
  instance_type   = var.instance_type[0]
  subnet_id       = aws_subnet.kmaster_subnets_public.id
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.sg_kmaster.id] # If the subnet is associated you cannot use the name but the sg id
  root_block_device {
    volume_size           = "15"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
    tags = {
      Name = "ebs_kmaster"
    }
  }
  # ebs_block_device {
  #   device_name           = "/dev/xvda"
  #   volume_size           = 35
  #   volume_type           = "sdh"
  #   encrypted             = true
  #   delete_on_termination = true
  # }

  tags = {
    Name = var.kmaster_server_name
  }
}

# kworker server instance
resource "aws_instance" "kworker_instance" {
  #count           = 1
  ami             = var.image_id
  instance_type   = var.instance_type[0]
  subnet_id       = aws_subnet.kworker_subnets_public.id
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.sg_kworker.id] # If the subnet is associated you cannot use the name but the sg id
  root_block_device {
    volume_size           = "15"
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
    tags = {
      Name = "ebs_kworker"
    }
  }
  # ebs_block_device {
  #   device_name           = "/dev/xvda"
  #   volume_size           = 35
  #   volume_type           = "sdh"
  #   encrypted             = true
  #   delete_on_termination = true
  # }

  tags = {
    Name = var.kworker_server_name
  }
}


variable "region_name" {
  description = "region name"
}

variable "vpc_name" {
  description = "Name of the virtual private cloud"
}

variable "vpc_cidr_block" {
  description = "The cidr block of the vpc"
}

variable "igw_name" {
  description = "Name of the internet gateway"
}

variable "jenkinsingressrules" {
  description = "Ingress rules in list for easy updates"
  type        = list(number)
}

variable "monitoringingressrules" {
  description = "Ingress rules in list for easy updates"
  type        = list(number)
}

variable "kmaster_ingressrules" {
  description = "Ingress rules in list for easy updates"
  type        = list(number)
}

variable "kworker_ingressrules" {
  description = "Ingress rules in list for easy updates"
  type        = list(number)
}

variable "key_pair_name" {
  description = "The name of the EC2 key to sign into the instance"
  type        = string
}

variable "image_id" {
  description = "The key use to log into the instances"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use for this project"
  type        = list(string)
}

variable "subnet-cidr-jenkinsPb" {
  description = "cidr block for the jenkins public subnet"
}

variable "subnet-cidr-jenkinsPr" {
  description = "cidr block for the jenkins private subnet"
}

variable "jenkins-subnetPb-name" {
  description = "Name for the jenkins server public subnet"
}
variable "jenkins-subnetPr-name" {
  description = "Name for the jenkins server private subnet"
}

variable "public-rt-nameJ" {
  description = "name of the public-rt jenkins server"
}

variable "private-rt-nameJ" {
  description = "name of the private-rt jenkins server"
}

variable "anywhere_ip" {
  description = "ip accessible for from anywhere"
}

variable "jenkins_server_sg_name" {
  description = "jenkins server security group"
}

variable "jenkins_server_name" {
  description = "jenkins server name"
}

variable "subnet-cidr-monitoringPb" {
  description = "cidr block for the monitoring public subnet"
}

variable "subnet-cidr-monitoringPr" {
  description = "cidr block for the monitoring private subnet"
}

variable "monitoring-subnetPb-name" {
  description = "Name for the monitoring server public subnet"
}
variable "monitoring-subnetPr-name" {
  description = "Name for the monitoring server private subnet"
}

variable "public-rt-nameM" {
  description = "name of the public-rt monitoring server"
}

variable "private-rt-nameM" {
  description = "name of the private-rt monitoring server"
}

variable "monitoring_server_sg_name" {
  description = "monitoring server security group"
}

variable "monitoring_server_name" {
  description = "monitoring server name"
}

variable "subnet-cidr-kmasterPb" {
  description = "cidr block for the kmaster public subnet"
}

variable "subnet-cidr-kmasterPr" {
  description = "cidr block for the kmaster private subnet"
}

variable "kmaster-subnetPb-name" {
  description = "Name for the kmaster server public subnet"
}
variable "kmaster-subnetPr-name" {
  description = "Name for the kmaster server private subnet"
}

variable "public-rt-nameKM" {
  description = "name of the public-rt kmaster server"
}

variable "private-rt-nameKM" {
  description = "name of the private-rt kmaster server"
}

variable "kmaster_server_sg_name" {
  description = "jenkins server security group"
}

variable "kmaster_server_name" {
  description = "jenkins server name"
}

variable "subnet-cidr-kworkerPb" {
  description = "cidr block for the kworker public subnet"
}

variable "subnet-cidr-kworkerPr" {
  description = "cidr block for the kworker private subnet"
}

variable "kworker-subnetPb-name" {
  description = "Name for the kmaster server public subnet"
}
variable "kworker-subnetPr-name" {
  description = "Name for the kworker server private subnet"
}

variable "public-rt-nameKW" {
  description = "name of the public-rt kworker server"
}

variable "private-rt-nameKW" {
  description = "name of the private-rt kworker server"
}

variable "kworker_server_sg_name" {
  description = "kworker server security group"
}

variable "kworker_server_name" {
  description = "kworker server name"
}  
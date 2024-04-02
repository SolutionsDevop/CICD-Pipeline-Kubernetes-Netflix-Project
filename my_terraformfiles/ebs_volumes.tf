# Create volumes and attached it to the servers

# resource "aws_ebs_volume" "vol_jenkins" {
#   availability_zone = aws_instance.jenkins_instance.availability_zone
#   size              = 35
#   tags = {
#     Name = "ebs_jenkins"
#   }
# }
# resource "aws_volume_attachment" "vol_att_jenkins" {
#   device_name  = "/dev/sda1"
#   volume_id    = aws_ebs_volume.vol_jenkins.id
#   instance_id  = aws_instance.jenkins_instance.id
#   force_detach = true
#   skip_destroy = false

# }


# resource "aws_ebs_volume" "vol_monitoring" {
#   availability_zone = aws_instance.monitoring_instance.availability_zone
#   size              = 15
#   tags = {
#     Name = "ebs_monitoring"
#   }
# }
# resource "aws_volume_attachment" "vol_att_monitoring" {
#   device_name  = "/dev/sda1"
#   volume_id    = aws_ebs_volume.vol_monitoring.id
#   instance_id  = aws_instance.monitoring_instance.id
#   force_detach = true
#   skip_destroy = false
# }
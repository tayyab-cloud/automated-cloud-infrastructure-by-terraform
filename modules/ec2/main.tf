resource "aws_instance" "my_instance" {
    count         = length(var.subnets)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnets, count.index )
  security_groups = [var.security_group_id]
  user_data = templatefile("${path.module}/install_apache.sh", {
    server_id = count.index + 1
  })


  tags = {
    Name = "${var.project_name}-ec2-instance-${count.index + 1}"
  }
  
}
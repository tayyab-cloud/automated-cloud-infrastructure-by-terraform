output "sg_id" {
    description = "The ID of the public security group"
    value       = aws_security_group.public_sg.id
  
}

output "public_subnet_1_id" {
    description = "The ID of the public subnet 1"
    value       = aws_subnet.public_subnet_1.id
  
}

output "public_subnet_2_id" {
    description = "The ID of the public subnet 2"
    value       = aws_subnet.public_subnet_2.id
  
}

output "vpc_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.my_vpc.id
  
}
variable "project_name" {
    description = "The name of the project"
    type        = string
  
}
 
variable "vpc_id" {
    description = "The ID of the VPC"
    type        = string
  
}

variable "subnets" {
    description = "List of subnet ID's for EC2 instance"
    type        = list(string)
  
}

variable "security_group_id" {
    description = "The security group ID to associate with the instance"
    type        = string
  
}

variable "instance_ids" {
    description = "List of EC2 instance IDs"
    type        = list(string)
  
}
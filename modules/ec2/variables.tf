variable "instance_type" {
    description = "The type of instance to use"
    type        = string
   
  
}

variable "ami_id" {
    description = "The AMI ID to use for the instance"
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

variable "project_name" {
    description = "The name of the project"
    type        = string
  
}

variable "key_name" {
    description = "The name of the key pair"
    type        = string
  
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile name to attach to EC2"
  type        = string
}
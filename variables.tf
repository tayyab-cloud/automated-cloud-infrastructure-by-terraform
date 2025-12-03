variable "region" {
    description = "The AWS region to deploy resources in."
    type        = string
  
}

variable "project_name" {
    description = "The name of the project."
    type        = string
  
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC."
    type        = string
  
}

variable "pub_sub_1_cidr" {
    description = "The CIDR block for the public subnet in availability zone 1."
    type        = string
  
}

variable "pub_sub_2_cidr" {
    description = "The CIDR block for the public subnet in availability zone 2."
    type        = string
  
}

variable "availability_zone_1" {
    description = "The first availability zone for the public subnet."
    type        = string
  
}

variable "availability_zone_2" {
    description = "The second availability zone for the public subnet."
    type        = string
  
}


variable "instance_type" {
    description = "The type of EC2 instance to launch."
    type        = string
  
}

variable "ami_id" {
    description = "The AMI ID to use for the EC2 instance."
    type        = string
  
}

variable "s3_bucket_name" {
    description = "The name of the S3 bucket."
    type        = string
  
}


variable "cidr_vpc" {
    description = "The CIDR block for the VPC."
    type        = string
    
  
}

variable "project_name" {
    description = "The name of the project."
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
    description = "The first availability zone."
    type        = string

  
}

variable "availability_zone_2" {
    description = "The second availability zone."
    type        = string
  
}
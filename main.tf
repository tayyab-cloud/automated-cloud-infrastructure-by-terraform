module "vpc" {
    source = "./modules/vpc"
    cidr_vpc = var.vpc_cidr
    project_name = var.project_name
    pub_sub_1_cidr = var.pub_sub_1_cidr
    pub_sub_2_cidr = var.pub_sub_2_cidr
    availability_zone_1 = var.availability_zone_1
    availability_zone_2 = var.availability_zone_2   
}

module "ec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    ami_id = var.ami_id
    subnets = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
    security_group_id = module.vpc.sg_id
    project_name = var.project_name
    
}

module "alb" {
    source = "./modules/alb"
    project_name = "${var.project_name}-alb"
    vpc_id = module.vpc.vpc_id
    subnets = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
    security_group_id = module.vpc.sg_id
    instance_ids = module.ec2.instance_ids
    
}

module "s3" {
    source = "./modules/s3"
    bucket_name = var.s3_bucket_name
  
}

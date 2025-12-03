resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc
    tags = {
        Name = "${var.project_name}-vpc"
    }
  
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = var.pub_sub_1_cidr
    availability_zone = var.availability_zone_1
    map_public_ip_on_launch = true
        tags = {
            Name = "${var.project_name}-public-subnet-1"
        }
  
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = var.pub_sub_2_cidr
    availability_zone = var.availability_zone_2
    map_public_ip_on_launch = true
        tags = {
            Name = "${var.project_name}-public-subnet-2"
        }
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "${var.project_name}-igw"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${var.project_name}-public-rt"
    }
}

resource "aws_route_table_association" "public_subnet_1_assoc" {
    subnet_id      = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet_2_assoc" {
    subnet_id      = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "public_sg" {
    name        = "${var.project_name}-public-sg"
    description = "Allow inbound HTTP and SSH"
    vpc_id      = aws_vpc.my_vpc.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-public-sg"
    }
}
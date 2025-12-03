resource "aws_alb" "my_alb" {
    name = "${var.project_name}-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.security_group_id]
    subnets = var.subnets
    tags = {
        Name = "${var.project_name}-alb"
    } 
}

resource "aws_alb_target_group" "my_target_group" {
    name = "${var.project_name}-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id 
    health_check {
        path = "/"
        protocol = "HTTP"
        matcher = "200"
        interval = 30
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 2
    }
  
}

resource "aws_alb_listener" "my_listener" {
    load_balancer_arn = aws_alb.my_alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_alb_target_group.my_target_group.arn
    }
  
}

resource "aws_alb_target_group_attachment" "attach" {
    count           = length(var.instance_ids)
    target_group_arn = aws_alb_target_group.my_target_group.arn
    target_id       = var.instance_ids[count.index]
    port            = 80
}
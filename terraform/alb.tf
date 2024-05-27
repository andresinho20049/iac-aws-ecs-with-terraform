resource "aws_lb" "lb_application" {
  name = "lb-ecs-${var.enviroment}"
  load_balancer_type = "application"
  security_groups = [aws_security_group.security_group_lb.id]
  subnets = module.vpc.public_subnets
}

resource "aws_lb_target_group" "lb_target_group" {
  name        = "lb-target-ecs-${var.enviroment}"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb_application.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}

output "lb_dns" {
  value = aws_lb.lb_application.dns_name
}
resource "aws_security_group" "security_group_lb" {
  name = "security-group-lb"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "security_group_ingress_role_lb" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.security_group_lb.id
}

resource "aws_security_group_rule" "security_group_egress_role_lb" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.security_group_lb.id
}




#Private network
resource "aws_security_group" "security_group_private" {
  name = "security-group-private"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "security_group_ingress_role_private" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = aws_security_group.security_group_lb.id
    security_group_id = aws_security_group.security_group_private.id
}

resource "aws_security_group_rule" "security_group_egress_role_private" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.security_group_private.id
}
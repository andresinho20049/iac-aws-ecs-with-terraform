resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster-${var.service_name}"
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_fargate" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_task_definition" "ecs_task_fargate" {
  family                   = "ecs-task-fargate-${var.service_name}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  container_definitions = jsonencode([
    {
      name      = "${var.container_name}"
      image     = "${var.image}"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])

  execution_role_arn = aws_iam_role.iam_role.arn
}

resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service-${var.service_name}"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_fargate.arn
  desired_count   = 3

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "${var.container_name}"
    container_port   = var.container_port
  }

  network_configuration {
    security_groups = [aws_security_group.security_group_private.id]
    subnets = module.vpc.private_subnets
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight = 1
  }
}
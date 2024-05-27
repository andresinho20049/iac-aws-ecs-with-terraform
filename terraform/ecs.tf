resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster-${var.enviroment}"
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_fargate" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_task_definition" "ecs_task_fargate" {
  family                   = "ecs-task-fargate-${var.enviroment}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  container_definitions = jsonencode([
    {
      name      = "docker-mockapi-${var.enviroment}"
      image     = "andresinho200498/mockapi"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])

  execution_role_arn = aws_iam_role.iam_role.arn
}

resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service-${var.enviroment}"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_fargate.arn
  desired_count   = 3

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "docker-mockapi-${var.enviroment}"
    container_port   = 8080
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
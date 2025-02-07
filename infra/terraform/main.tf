resource "aws_ecs_cluster" "python_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_ecs_task_definition" "python_task" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = var.task_memory
  cpu                      = var.task_cpu
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = "python-app"
      image = var.container_image
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "python_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.python_cluster.id
  task_definition = aws_ecs_task_definition.python_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.public_subnet.id]
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}

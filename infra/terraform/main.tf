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
        Principal = { Service = "ecs-tasks.amazonaws.com" }
        Action = "sts:AssumeRole"
      }
    ]
  })
}


resource "aws_iam_role" "ec2_instance_connect_role" {
  name = "EC2InstanceConnectRole"
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_instance_connect_policy" {
  role       = aws_iam_role.ec2_instance_connect_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2InstanceConnect"
}
resource "aws_instance" "python_app" {
  ami                    = "ami-0b0ea68c435eb488d" # Cambia por una AMI compatible con Instance Connect
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile   = aws_iam_role.ec2_instance_connect_role.name
  key_name               = "my-key" # Cambia por tu clave SSH

  user_data = <<-EOF
    #!/bin/bash
    yum install -y ec2-instance-connect
  EOF
}

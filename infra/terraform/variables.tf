variable "aws_access_key" {
    description = "The IAM public access key"
}

variable "aws_secret_key" {
    description = "IAM secret access key"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "AWS availability zone"
  default     = "us-east-1a"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "python-cluster"
}

variable "task_family" {
  description = "ECS task family name"
  default     = "python-task"
}

variable "task_memory" {
  description = "Memory allocated for the task"
  default     = "512"
}

variable "task_cpu" {
  description = "CPU allocated for the task"
  default     = "256"
}

variable "container_image" {
  description = "Docker image for the container"
  default     = "your-dockerhub-user/python-app:latest"
}

variable "ecs_service_name" {
  description = "ECS service name"
  default     = "python-service"
}

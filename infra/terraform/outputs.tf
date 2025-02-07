output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.python_cluster.name
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.python_service.name
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

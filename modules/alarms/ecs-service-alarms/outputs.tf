output "ecs_service_running_tasks_arn" {
  value = aws_cloudwatch_metric_alarm.ecs_service_running_tasks.arn
}

output "ecs_service_running_tasks_id" {
  value = aws_cloudwatch_metric_alarm.ecs_service_running_tasks.id
}

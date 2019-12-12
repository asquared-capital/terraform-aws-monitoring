# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

resource "aws_cloudwatch_metric_alarm" "ecs_service_task_running_tasks" {
  alarm_name        = "${var.ecs_cluster_name}-${var.ecs_service_name}-running-tasks"
  alarm_description = "An alarm that goes off if the CPU usage is too high in the ECS Service ${var.ecs_service_name}."
  namespace         = "AWS/ECS"
  metric_name       = "CPUUtilization"

  dimensions = {
    ServiceName = var.ecs_service_name
    ClusterName = var.ecs_cluster_name
  }

  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = var.ecs_service_task_running_tasks_evaluation_periods
  period                    = var.ecs_service_task_running_tasks_period
  statistic                 = var.ecs_service_task_running_tasks_statistic
  threshold                 = var.ecs_service_task_running_tasks_threshold
  unit                      = "Average"
  alarm_actions             = var.alarm_sns_topic_arns
  ok_actions                = var.alarm_sns_topic_arns
  insufficient_data_actions = var.alarm_sns_topic_arns
  treat_missing_data        = var.ecs_service_task_running_tasks_treat_missing_data
  tags                      = var.tags
}

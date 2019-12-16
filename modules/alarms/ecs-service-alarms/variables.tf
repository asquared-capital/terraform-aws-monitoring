# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These variables are expected to be passed in by the operator when calling this terraform module.
# ---------------------------------------------------------------------------------------------------------------------

variable "alarm_sns_topic_arns" {
  description = "A list of SNS topic ARNs to notify when the ECS Service alarms change to ALARM, OK, or INSUFFICIENT_DATA state"
  type        = list(string)
}

variable "actions_enabled" {
  description = " Indicates whether or not actions should be executed during any changes to the alarm's state. "
  type        = bool
  default     = true
}

variable "ecs_service_name" {
  description = "The name of the ECS Service"
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS Cluster the ECS Service is in"
  type        = string
}

variable "ecs_service_running_tasks_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
  default     = 1
}

variable "ecs_service_running_tasks_period" {
  description = "The period in seconds over which the specified statistic is applied. Amazon ECS sends metrics to CloudWatch every 60 seconds, so 60 seconds is the minimum."
  type        = number
  default     = 60
}

variable "ecs_service_running_tasks_statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = "Average"
}

variable "ecs_service_running_tasks_threshold" {
  description = "Trigger an alarm if the ECS Service has a CPU utilization percentage above this threshold"
  type        = number
  default     = 1
}

variable "ecs_service_running_tasks_treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching."
  type        = string
  default     = "missing"
}

variable "tags" {
  description = "A mapping of tags to assign to the metric alarm. The key is the tag name and the value is the tag value."
  type        = map(string)
  default     = {}
}

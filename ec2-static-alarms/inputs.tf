variable "sns_topic_name" {
  description = "Name of the SNS topic to collect the alarms"
  type        = string
}

variable "sns_display_name" {
  description = "Friendly name for the SNS topic"
  type        = string
  default     = null
}

variable "https_webhooks" {
  description = "Endpoint to send notifications of the alarms"
  type        = list(string)
  validation {
    condition     = length(var.https_webhooks) > 0
    error_message = "No webhooks specified."
  }
}

variable "ec2_id" {
  description = "ID of the EC2 instance where to attach the metrics"
  type        = string
}

variable "alarms" {
  description = "Alarms"
  type = map(object({
    comparison_operator = string
    threshold           = string
    metric_name         = string
  }))

  validation {
    condition     = length(var.alarms) > 0
    error_message = "No alarms provided."
  }

  validation {
    condition     = alltrue([for alarm_name, alarm in var.alarms : length(alarm.comparison_operator) > 0])
    error_message = "Missing comparison operator."
  }

  validation {
    condition     = alltrue([for alarm_name, alarm in var.alarms : alarm.threshold != ""])
    error_message = "Alarm threshold cannot be empty."
  }

  validation {
    condition     = alltrue([for alarm_name, alarm in var.alarms : contains(["GreaterThanOrEqualToThreshold", "GreaterThanThreshold", "LessThanThreshold", "LessThanOrEqualToThreshold"], alarm.comparison_operator)])
    error_message = "Only alarmas with static operators supported: reaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold."
  }

}

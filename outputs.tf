output "alarm_arns" {
  description = "Map with keys being alarm names and values the AWS ARNs."
  value       = module.alarms.alarm_arns
}

output "sns_subscription_arns" {
  description = "ARN of the SNS subscriptions created for the alarms"
  value       = module.alarms.sns_subscription_arns
}

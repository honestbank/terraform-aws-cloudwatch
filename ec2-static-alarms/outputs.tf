output "alarm_arns" {
  description = "Map with keys being alarm names and values the AWS ARNs."
  value = {
    for alarm_name, alarm in aws_cloudwatch_metric_alarm.alarms :
    alarm_name => alarm.arn
  }
}

output "sns_subscription_arns" {
  description = "ARN of the SNS subscriptions created for the alarms"
  value = [
    for webh, subscription in aws_sns_topic_subscription.subscription :
    subscription.arn
  ]
}

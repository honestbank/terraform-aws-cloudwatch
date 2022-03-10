resource "aws_cloudwatch_metric_alarm" "alarms" {
  for_each            = var.alarms
  alarm_name          = each.key
  comparison_operator = each.value.comparison_operator
  metric_name         = each.value.metric_name
  threshold           = each.value.threshold
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = each.value.period # seconds, less than this might cause error depending on EC2 configuration
  evaluation_periods  = each.value.evaluation_period
  dimensions = {
    InstanceId = var.ec2_id
  }
  actions_enabled = true
  alarm_actions   = [aws_sns_topic.notifications.arn]
  tags = {
    Name = each.key
  }

  treat_missing_data = "breaching"
}

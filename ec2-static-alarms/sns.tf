resource "aws_sns_topic" "notifications" {
  name              = var.sns_topic_name
  display_name      = var.sns_display_name
  kms_master_key_id = "alias/aws/sns"
  tags = {
    Name = var.sns_display_name
  }
}

resource "aws_sns_topic_subscription" "subscription" {
  for_each               = toset(var.https_webhooks)
  topic_arn              = aws_sns_topic.notifications.arn
  protocol               = "https"
  endpoint               = each.value
  endpoint_auto_confirms = true
}

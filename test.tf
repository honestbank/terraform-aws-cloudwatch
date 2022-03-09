module "alarms" {
  source           = "./ec2-static-alarms"
  sns_topic_name   = "terratest-ec2-static-alarms-${random_string.test_instance.result}_1"
  sns_display_name = "terratest EC2 static alarms ${random_string.test_instance.result}_1"
  https_webhooks   = var.https_webhooks
  ec2_id           = aws_instance.test_ec2_1.id
  alarms = {
    "example-alarm" : {
      comparison_operator = "LessThanThreshold"
      threshold           = "90"
      metric_name         = "CPUUtilization"
    }
  }
}

resource "random_string" "test_instance" {
  length  = 8
  upper   = false
  number  = true
  special = false
}

locals {
  test_display_name = "terratest-ec2-static-alarms-${random_string.test_instance.result}"
}


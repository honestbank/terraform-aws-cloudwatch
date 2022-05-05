variable "aws_region" {
  description = "AWS Region where to run the tests"
  type        = string
}

variable "pagerduty_token" {
  description = "Token to initialize PagerDuty provider"
  type        = string
}

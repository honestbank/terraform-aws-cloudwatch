variable "https_webhooks" {
  description = "Endpoint to send notifications of the alarms"
  type        = list(string)
}

variable "aws_region" {
  description = "AWS Region where to run the tests"
  type        = string
}

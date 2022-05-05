terraform {
  required_providers {
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = ">=2.4.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Name = local.test_display_name
    }
  }
}

provider "pagerduty" {
  token = var.pagerduty_token
}

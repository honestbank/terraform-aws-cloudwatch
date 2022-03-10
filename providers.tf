provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Name = local.test_display_name
    }
  }
}

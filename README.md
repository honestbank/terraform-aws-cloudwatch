# Terraform AWS CloudWatch-related modules

This repository contains various Terraform modules related to AWS CloudWatch. In particular:
* `ec2-static-alarms`: Module to create static alarms related to EC2 instances. The module also configures the webhooks to be notified upon triggering of the alarms.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.74.3 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alarms"></a> [alarms](#module\_alarms) | ./ec2-static-alarms | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.test_ec2_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_subnet.test_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.test_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [random_string.test_instance](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region where to run the tests | `string` | n/a | yes |
| <a name="input_https_webhooks"></a> [https\_webhooks](#input\_https\_webhooks) | Endpoint to send notifications of the alarms | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alarm_arns"></a> [alarm\_arns](#output\_alarm\_arns) | Map with keys being alarm names and values the AWS ARNs. |
| <a name="output_sns_subscription_arns"></a> [sns\_subscription\_arns](#output\_sns\_subscription\_arns) | ARN of the SNS subscriptions created for the alarms |
<!-- END_TF_DOCS -->

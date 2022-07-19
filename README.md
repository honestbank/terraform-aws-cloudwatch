# Terraform AWS CloudWatch-related modules

This repository contains various Terraform modules related to AWS CloudWatch. In particular:
* `ec2-static-alarms`: Module to create static alarms related to EC2 instances. The module also configures the webhooks to be notified upon triggering of the alarms.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | >=2.4.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | 2.5.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.7.2 |

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
| [pagerduty_escalation_policy.test_escalation_policy](https://registry.terraform.io/providers/pagerduty/pagerduty/latest/docs/resources/escalation_policy) | resource |
| [pagerduty_service.test_service](https://registry.terraform.io/providers/pagerduty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service_integration.cloudwatch](https://registry.terraform.io/providers/pagerduty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_user.test_user](https://registry.terraform.io/providers/pagerduty/pagerduty/latest/docs/resources/user) | resource |
| [random_string.test_instance](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_sleep.wait_service_integration](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [pagerduty_vendor.cloudwatch](https://registry.terraform.io/providers/pagerduty/pagerduty/latest/docs/data-sources/vendor) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region where to run the tests | `string` | n/a | yes |
| <a name="input_pagerduty_token"></a> [pagerduty\_token](#input\_pagerduty\_token) | Token to initialize PagerDuty provider | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alarm_arns"></a> [alarm\_arns](#output\_alarm\_arns) | Map with keys being alarm names and values the AWS ARNs. |
| <a name="output_sns_subscription_arns"></a> [sns\_subscription\_arns](#output\_sns\_subscription\_arns) | ARN of the SNS subscriptions created for the alarms |
<!-- END_TF_DOCS -->

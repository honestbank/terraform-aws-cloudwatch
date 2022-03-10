# ec2-static-alarms
This Terraform component module constructs static CloudWatch Alarms related to an specific EC2 instance. It creates an SNS topic that collects the alarms triggered and mutliple HTTPS subscribers to be notified through HTTPS webhooks.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.52 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.52 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.alarms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.notifications](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarms"></a> [alarms](#input\_alarms) | Alarms | <pre>map(object({<br>    comparison_operator = string<br>    threshold           = string<br>    metric_name         = string<br>    period              = number<br>    evaluation_period   = string<br>  }))</pre> | n/a | yes |
| <a name="input_ec2_id"></a> [ec2\_id](#input\_ec2\_id) | ID of the EC2 instance where to attach the metrics | `string` | n/a | yes |
| <a name="input_https_webhooks"></a> [https\_webhooks](#input\_https\_webhooks) | Endpoint to send notifications of the alarms | `list(string)` | n/a | yes |
| <a name="input_sns_display_name"></a> [sns\_display\_name](#input\_sns\_display\_name) | Friendly name for the SNS topic | `string` | `null` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | Name of the SNS topic to collect the alarms | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alarm_arns"></a> [alarm\_arns](#output\_alarm\_arns) | Map with keys being alarm names and values the AWS ARNs. |
| <a name="output_sns_subscription_arns"></a> [sns\_subscription\_arns](#output\_sns\_subscription\_arns) | ARN of the SNS subscriptions created for the alarms |
<!-- END_TF_DOCS -->

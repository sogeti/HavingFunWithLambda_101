## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.lambda_role_policy_sns](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_role_policy](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/lambda_permission) | resource |
| [aws_sns_topic.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/sns_topic_subscription) | resource |
| [aws_lambda_invocation.buienradar](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/lambda_invocation) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mail_subscribers"></a> [mail\_subscribers](#input\_mail\_subscribers) | list of mails which will be subscribed to the SNS topic | `list(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefixing value for each of the resources created within this tf code | `string` | `"101"` | no |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | Schedule expression for the invocation of the lambda function, details on option on https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html<br> defaulting to 17:00 (UTC) | `string` | `"cron(0 17 * * ? *)"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tomorrow_weather"></a> [tomorrow\_weather](#output\_tomorrow\_weather) | Output of the Lambda, which will give tomorrows' weather |

#tfsec:ignore:aws-lambda-enable-tracing
resource "aws_lambda_function" "buienradar" {
  filename         = "${path.module}/buienradar/buienradar-lambda.zip"
  function_name    = "${var.prefix}-lambda-function"
  description    = "${var.prefix}-lambda-function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "buienradar-lambda.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/buienradar/buienradar-lambda.zip")


  #Configuration Lambda
  runtime                        = "python3.9"
  timeout                        = "20"
  memory_size                    = "128"
  reserved_concurrent_executions = "1"

  #xray configuration
  tracing_config {
    mode = "Active"
  }


  #Environment Config
  environment {
    variables = {
      TopicArn = "${aws_sns_topic.buienradar.arn}"
    }
  }
  tags = {
    Name = "${var.prefix}-lambda-function"
  }
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "buienradar" {
  name              = "/aws/lambda/${aws_lambda_function.buienradar.function_name}"
  retention_in_days = 3

  tags = {
    Name = "${var.prefix}-lambda-function"
  }
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.buienradar.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.buienradar.arn
}

resource "aws_sns_topic" "buienradar" {
  name         = "${var.prefix}-sns-topic"
  display_name = "101: Forecast for tomorrow"

  tags = {
    Name = "${var.prefix}-sns-topic"
  }
}

resource "aws_sns_topic_subscription" "buienradar" {
  for_each  = toset(var.mail_subscribers)
  topic_arn = aws_sns_topic.buienradar.arn
  protocol  = "email"
  endpoint  = each.key
}
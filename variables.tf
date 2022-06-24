variable "prefix" {
  description = "Prefixing value for each of the resources created within this tf code"
  type        = string
  default     = "101"
}

variable "schedule_expression" {
  description = "Schedule expression for the invocation of the lambda function, details on option on https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html\n defaulting to 17:00 (UTC)"
  type        = string
  default     = "cron(0 17 * * ? *)"
}
variable "mail_subscribers" {
  description = "list of mails which will be subscribed to the SNS topic"
  type        = list(string)
}
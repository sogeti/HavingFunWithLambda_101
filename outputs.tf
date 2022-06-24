output "tomorrow_weather" {
description = "Output of the Lambda, which will give tomorrows' weather"
  value = replace(data.aws_lambda_invocation.buienradar.result,"\"","")
}
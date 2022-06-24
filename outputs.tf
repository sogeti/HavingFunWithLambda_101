output "tomorrow_weather" {
  value = replace(data.aws_lambda_invocation.buienradar.result,"\"","")
}
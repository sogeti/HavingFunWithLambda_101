provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "local" {
    path = "../101.tfstate"
  }
}

data "aws_lambda_invocation" "buienradar" {
  function_name = aws_lambda_function.buienradar.function_name

  input = <<JSON
{
  "always_run": "${timestamp()}"
}
JSON
}
resource "aws_iam_role" "lambda_role" {
  name = "${var.prefix}-lambda-role-buienradar"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name = "${var.prefix}-lambda-role-buienradar"
  }
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lambda_role_policy_sns" {
  name   = "${var.prefix}-lambda-role-buienradar"
  role   = aws_iam_role.lambda_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Action": [
              "sns:Publish"
          ],
          "Resource": [
              "${aws_sns_topic.buienradar.arn}"
          ],
          "Effect": "Allow",
          "Sid": "SNSPublishAllow"
      }
  ]
}
EOF
}
# Copyright © 2018 VMware, Inc. All Rights Reserved.

provider "aws" {
  region     = "us-west-2"
  access_key = "${var.aws_secret["access_key"]}"
  secret_key = "${var.aws_secret["secret_key"]}"
}



resource "aws_iam_role" "basic-lambda-role" {
  name = "basic-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# AWS Lambda function for provisioning vmc sddc 
resource "aws_lambda_function" "provision-vmc-sddcs-terraform" {
    s3_bucket = "vmc-skyscraper-lambda"
    function_name = "provision-vmc-sddcs"
    role = "${aws_iam_role.basic-lambda-role.arn}"
    handler = "sddc.AwsSddc::handleRequest"
    runtime = "java8"
    timeout = 300
    memory_size = 1024
    s3_key = "vmc-lambda-1.0.jar"
    environment{
        variables {
          user_refresh_token = "${var.provision_info["user_refresh_token"]}"
          orgId = "${var.provision_info["orgId"]}"
          name = "${var.provision_info["name"]}"
          region = "${var.provision_info["region"]}"
          numOfHosts = "${var.provision_info["numOfHosts"]}"
          email = "${var.provision_info["email"]}"
          connected_account_id = "${var.provision_info["connected_account_id"]}"
          customer_subnet_ids = "${var.provision_info["customer_subnet_ids"]}"
          vpc_cidr ="${var.provision_info["vpc_cidr"]}"
        }
    }
}

# Enable the following section if you want to automate the SDDC deployments , the following sections will create a cloud watch event that will invoke the lambda at scheudled time
# as configured in the provision_info.tf for eg deploy_time = "cron(0/5 * ? * MON-FRI *)" , indicates that the event will be fired every 5 minutes from monday - friday
# the deploy_time takes the value as a cron express for more information refer to https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html

/* 

resource "aws_cloudwatch_event_rule" "fixed_time" {
    name = "fixed_time"
    description = "triggered at a fixed time"
    schedule_expression = "${var.provision_info["deploy_time"]}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_provision-vmc-sddcs" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.provision-vmc-sddcs-terraform.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.fixed_time.arn}"
}

# You can configure the json payload with actual values and these values will be used to inoke the lambda

 resource "aws_cloudwatch_event_target" "provision-vmc-sddcs" {
  target_id = "provision-vmc-sddcs-terraform"
  rule      = "${aws_cloudwatch_event_rule.fixed_time.name}"
  arn       = "${aws_lambda_function.provision-vmc-sddcs-terraform.arn}"
  input = <<INPUT
  {
    "user_refresh_token": "",
    "orgId": "",
    "name": "",
    "region": "US_WEST_2",
    "numOfHosts": "",
    "email":"",
    "connected_account_id":"",
    "customer_subnet_ids":"",
    "vpc_cidr":""
  }
  INPUT
} 
*/

# CloudFormation Create SDDC Template

## Overview

This folder contains an example AWS CloudFormation template which allows for the creation of a new VMware Cloud on AWS SDDC in US_WEST_2 (Oregon) Only.

### Prerequisites

* AWS Account
* VMware Cloud on AWS Account and Organization
* An existing account link as part of a previous SDDC deployment

## Try it out
Use the following steps to setup the CloudFormation template and run it to create a new VMware Cloud on AWS SDDC:

* Log in to your AWS account and go to AWS CloudFormation
* Change the region to US WEST (Oregon)
* Click the "Create New Stack" button
* Either upload the downloaded version of the template from this repository or use the following URL for an existing version of this template (Specify an Amazon S3 template URL): https://s3-us-west-2.amazonaws.com/vmc-skyscraper-lambda/vmc-aws-cloud-CF-template.txt
* Click Next
* Type a Stack Name, this is for future identification purposes. Click Next
* Leave the options empty and click Next
* Click the check box "I acknowledge that AWS CloudFormation might create IAM resources." - This allows for the creation of a IAM role that will be used while executing this Lambda function inside the CloudFormation Template
* Click Create
* Wait while the lambda function is created in your AWS account
* "Create_Complete" will show the stack has been completed
* Click on the name of the stack under "Stack Name"
* Expand the Resources section and click on the Physical ID of the resource which has a Type of "AWS::Lambda::Function"
* You will now see the Lambda function which can be used to deploy the SDDC
* Add the input fields in the text boxes under the environment variables section, these will be used to create your SDDC.
    * connected_account_id: This is the Amazon account ID used to connect, this can be found by using the VMC API by calling GET /orgs/{org}/account-link/connected-accounts and is labeled id
    * customer_subnet_ids: This is the ID of the subnet, not the actual subnet itself, this can be found by using the VMC API by calling GET /orgs/{org}/account-link/compatible-subnets and is labeled subnet_id for the subnet_cidr_block that you want to use
    * Email: The email field is still under development and will not send an email at the moment
    * vpc_cidr: This is the subnet for management traffic, default is 10.2.0.0/16
    * name: The name of the SDDC to be created
    * numOfHosts: The number of hosts to add to the SDDC
    * orgId: Can be found in the VMware Cloud on AWS API or as part of the UI under an existing SDDC connection and the "Support Info" tab
    * region: Please use US_WEST_2 (case sensitive)
    * user_refresh_token: Can be found in the VMware Cloud on AWS UI by clicking on your name at the top right and then the "Oauth Refresh Token" button
* Click Save
* Click Test
* Change the Event Name to "CreateSDDC"
* Click Create
* Click Test to launch the Lambda Function and create your SDDC
* Click the Execution result and Details section to ensure the Lambda function was executed and a SDDC is being created
* Monitor the creation of the SDDC in the VMware Cloud on AWS UI or using the VMware Cloud on AWS APIs.


## Contributing

The vmware-cloud-on-aws-integration-examples project team welcomes contributions from the community. If you wish to contribute code and you have not
signed our contributor license agreement (CLA), our bot will update the issue when you open a Pull Request. For any
questions about the CLA process, please refer to our [FAQ](https://cla.vmware.com/faq). For more detailed information,
refer to [CONTRIBUTING.md](CONTRIBUTING.md).
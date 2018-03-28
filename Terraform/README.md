# Terraform Create SDDC Script

## Overview

This folder contains a Terraform script which allows for the creation of a new VMware Cloud on AWS SDDC in US_WEST_2 (Oregon) by deploying and executing a lambda function.

### Prerequisites

* AWS Account
* VMware Cloud on AWS Account and Organization
* Terraform client (https://www.terraform.io/downloads.html)


## Try it out
Use the following steps to setup the Terraform script and run it to create a new VMware Cloud on AWS SDDC:

* Download the .tf files from this repository into your terraform folder where the terraform client has been added
* Log in to your AWS account and go to your AWS Security Credentials
* Create or copy your access key ID and Security Access Key
* Edit the aws_secret.tf file and add the access key and secret_key from the above and save the file
* Edit the provision_info.tf file
    * refresh_token: Can be found in the VMware Cloud on AWS UI by clicking on your name at the top right and then the "Oauth Refresh Token" button
    * orgId: Can be found in the VMware Cloud on AWS API or as part of the UI under an existing SDDC connection and the "Support Info" tab
    * Name: The name of the SDDC to be created
    * region: Please use US_WEST_2 (case sensitive)
    * numOfHosts: The number of hosts to add to the SDDC
    * Email: The email field is still under development and will not send an email at the moment
    * deploy_time is the time you want the Lambda function to trigger
* From a command line in the same folder as your terraform client and the .tf files:
    * Run terraform init to initialize terraform
    * Run terraform apply to execute the terraform script and create the VMware Cloud on AWS SDDC
* Monitor the creation of the SDDC in the VMware Cloud on AWS UI or using the VMware Cloud on AWS APIs.


## Contributing

The vmware-cloud-on-aws-integration-examples project team welcomes contributions from the community. If you wish to contribute code and you have not
signed our contributor license agreement (CLA), our bot will update the issue when you open a Pull Request. For any
questions about the CLA process, please refer to our [FAQ](https://cla.vmware.com/faq). For more detailed information,
refer to [CONTRIBUTING.md](CONTRIBUTING.md).
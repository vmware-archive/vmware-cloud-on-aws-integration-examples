# Copyright © 2018 VMware, Inc. All Rights Reserved.

variable "aws_secret" {
   type = "map"

   default = {
   	region     = "us-west-2"
	access_key = ""
    secret_key = ""
   }
}

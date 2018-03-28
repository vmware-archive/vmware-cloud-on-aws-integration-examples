# Copyright © 2018 VMware, Inc. All Rights Reserved.

variable "provision_info" {
   type = "map"

   default = {
    user_refresh_token = ""
    orgId = ""
    name = ""
    region = "US_WEST_2"
  	numOfHosts = "1"
  	email = ""
  	deploy_time = ""
    connected_account_id = ""
    customer_subnet_ids = ""
    vpc_cidr = ""
   }
}

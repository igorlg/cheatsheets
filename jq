---
tags: [ jq, bash, zsh ]
---
# Describe all VPC Endpoint Services supported in a region.
#   Use JQ to filter out just the Service Names based on the
#   service's Endpoint Type (Gateway | Interface | GatewayLoadBalancer )
aws ec2 describe-vpc-endpoint-services \
    | jq '.ServiceDetails[] | select(.ServiceType[0].ServiceType=="Gateway") | .ServiceName'
# Printout:
# "com.amazonaws.ap-southeast-2.dynamodb"
# "com.amazonaws.ap-southeast-2.s3"


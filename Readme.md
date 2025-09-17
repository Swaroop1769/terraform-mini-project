The goal of the Project is to create a VPC with 3 Subnets and launch an EC2 instance in first Subnet or use an existing Subnet ID if provided...


## using Coalesce Function

- coalesce takes any number of arguments and returns the first one that isn't null or an empty string.

'''
terrafrom apply -var "create_vpc=false" -var "subnet_id=subent-xxxxxxxxx"
'''


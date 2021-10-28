# aws_terraform_modular_infra
The purpose of this personal project is to learn and understand the basics of Terraform. 
The goal was to create a simple environment on the AWS platform using Terraform with a modular approach. 

It's currently configured to launch a VPC with a public subnet. 
In this public subnet it launches an Ubuntu EC2 instance webserver bootstrapped with userdata to install Apache. The webserver simply displays some text. 

Using this template, you are able to launch the following resources in your AWS account:
* EC2 instance
* Elastic IP Address
* ENI (Elastic Network Interface)
* IGW (Internet Gateway)
* Key Pair 
* Route table
* Route table association
* Security group
* VPC (Virtual Private Cloud)
* Subnet 

NOTE:
Modify the *providers.tf* file to use your own AWS credentials file, more info on that [here](https://docs.aws.amazon.com/sdkref/latest/guide/file-location.html).

I was able to learn Terraform and create this project from the below tutorials:
* [Master Classs: Terraform for AWS (Beginner to Pro)](https://www.youtube.com/watch?v=tQlMj_nyN6s&list=PLMjNjGLy-cuzRMzjDU31f_bB2ftFA6W7e&index=8&ab_channel=ShankarZaiswal)
* [Terraform Course - Automate your AWS cloud infrastructure](https://www.youtube.com/watch?v=SLB_c_ayRMo&list=PLMjNjGLy-cuzRMzjDU31f_bB2ftFA6W7e&index=7&t=7197s&ab_channel=freeCodeCamp.org)

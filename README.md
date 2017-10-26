# terraform
*/ 
Everything in this directory can be initiated and run with terraform.  a few dependencies of note...
1. you need to acquire the palo alto networks vm in the aws marketplace
2. vpc must be enabled on your account, and you must have rights in your aws account
3. you must have an aws api key 
4. you must have an ssh key for initial access to your EC2 instance
any file named *.tf will be leveraged in your terraform plan
I'm still working on this myself, but values should not be hard coded into individual resources, but rather impelmented as variables and assigned values in the variables.tf file.
/*

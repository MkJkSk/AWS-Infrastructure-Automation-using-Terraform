module "dev-infra" {
  source = "./infra_app"
  env = "dev"
  bucket_name = "my-created-app-bucket"
  instance_count = 1
  instance_type = "t3.micro"
  ec2_ami_id = "ami-0f918f7e67a3323f0"
  hash_key = "customerID"

}


module "prd-infra" {
  source = "./infra_app"
  env = "prd"
  bucket_name = "my-created-app-bucket"
  instance_count = 2
  instance_type = "t3.micro"
  ec2_ami_id = "ami-0f918f7e67a3323f0"
  hash_key = "studentID"

}


module "stg-infra" {
  source = "./infra_app"
  env = "stg"
  bucket_name = "my-created-app-bucket"
  instance_count = 1
  instance_type = "t3.micro"
  ec2_ami_id = "ami-0f918f7e67a3323f0"
  hash_key = "employeeID"

}
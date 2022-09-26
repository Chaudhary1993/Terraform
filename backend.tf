terraform {
  backend "s3" {
    bucket = "tf-state-984trs"
    key = "Create-ec2-instances/terraform_state.tf"
    region = "ap-south-1"
  }
}
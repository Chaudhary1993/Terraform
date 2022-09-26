variable "AWS_ACCESS_KEY" {
  description = "aws access key"
  type        = string 
}

variable "AWS_SECRET_KEY" {
  description = "aws secret key"
  type        = string
}

variable "AWS_REGION" {
  description = "aws region"
  type        = string
  default     = "ap-south-1"  
}

variable "AMI_ID" {
  description = "Image ID"
  type = string
  default = "ami-024c319d5d14b463e"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}
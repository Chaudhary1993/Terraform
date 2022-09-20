resource "aws_instance" "first_instance" {
    count = 1
    ami  ="${var.AMI_ID}"
    instance_type = "t2.micro"

    tags = {
      Name = "demoinstance-${count.index}"
    }
}

#security Group for levelupvpc
resource "aws_security_group" "allow-levelup-ssh" {
  vpc_id = aws_vpc.levelup_VPC.id
  name = "allow-levelup-ssh"
  description = "security group that allow ssh connection"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name= "allow-levelup-ssh"
  }

}
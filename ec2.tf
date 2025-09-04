resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}infra-app-key"
  public_key = file("Mk-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}infra-app-sg"
  description = "this will be add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH OPEN"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP OPEN"
  }

  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"

  }
  tags = {
    name = "${var.env}infra-app-sg"
  }

}

resource "aws_instance" "my_instance" {
    count = var.instance_count
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.instance_type
  ami             = var.ec2_ami_id
  #user_data       = file("nginx.sh")

  root_block_device {
    volume_size = var.env=="prd" ? 15 : 10
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-infra-app-machine"
    Environment = var.env
  }

}
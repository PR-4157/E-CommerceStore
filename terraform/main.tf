resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "ecommerce_sg" {
  name = "ecommerce-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3001
    to_port     = 3004
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_default_vpc.default.id
}

resource "aws_instance" "ecommerce_server" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  key_name = "ecommerce-key"

  vpc_security_group_ids = [aws_security_group.ecommerce_sg.id]

  tags = {
    Name = "ecommerce-server"
  }
}

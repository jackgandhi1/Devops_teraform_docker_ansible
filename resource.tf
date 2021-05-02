resource "aws_instance" "web" {
  ami                    = "ami-04b1ddd35fd71475a"
  instance_type          = "t2.micro"
  key_name               = "phpapplication"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "phpdemoserver"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} >> inventory"
  }
}

resource "aws_security_group" "allow_tls" {
  name = "phpdemo"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "phpdemo"
  }
}

output "instanceip" {
  value = aws_instance.web.public_ip
  }

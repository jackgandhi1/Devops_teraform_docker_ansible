resource "aws_instance" "web" {
  ami                    = "ami-048f6ed62451373d9"
  instance_type          = "t2.micro"
  key_name               = "phproject_ec2application"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "PHP_Application_Server"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} >> inventory"
  }
}

resource "aws_security_group" "allow_tls" {
  name = "PHP_Application_sG"

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
    Name = "PHP_Application_SG"
  }
}

output "instanceip" {
  value = aws_instance.web.public_ip
  }

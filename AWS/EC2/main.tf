provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "webServer" {
  ami           = "ami-030e490c34394591b" // AWS Linux 2
  instance_type = "t2.micro"
  key_name      = "janDerBoss" // Key Name from EC2 here for authentication

  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "WebServerByTf"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "security-allow-sh"
  description = "Allow acces to Server via SSH"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_dns" {
  value = aws_instance.webServer.public_dns
}
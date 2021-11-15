provider "aws" {
  region = "eu-central-1"
  version = "~> 3.65.0"
}

resource "aws_instance" "webServer" {
  ami = "ami-0323c3dd2da7fb37d" // AWS Linux 2
  instance_type = "t2.micro"
  key_name = "NEED HERE" // Key Name from EC2 here for authentication

  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "WebServerByTf"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "security-allow-sh"
  description = "Allow acces to Server via SSH"

    ingress {
        desdescription = "Allow SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "instance_public_dns" {
  value = aws_instance.webServer.public_dns
}
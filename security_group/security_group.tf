resource "aws_security_group" "web" {
  name        = "web_sg"
  description = "Security Group para a aplicação web"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["189.0.206.218/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "security_group_id" {
  value = aws_security_group.web.id
}

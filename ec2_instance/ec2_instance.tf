resource "aws_key_pair" "key_pair" {
  key_name   = "NOME_DA_CHAVE"
  public_key = file("CHAVE_PUBLICA.pub") # Substitua "CHAVE_PUBLICA.pub" pelo caminho para sua chave pública
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name
  security_group_ids = [var.security_group_id]
}

output "instance_id" {
  value = aws_instance.ec2.id
}

resource "aws_eip" "elastic_ip" {
  instance = var.instance_id
}

resource "aws_route53_zone" "route53_zone" {
  name = "SEU_DOMINIO"
}

resource "aws_route53_record" "route53_record" {
  zone_id = aws_route53_zone.route53_zone.zone_id
  name    = "SEU_DOMINIO"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.elastic_ip.public_ip]
}

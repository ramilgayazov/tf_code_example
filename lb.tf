resource "aws_lb" "lbp" {
  name               = "lbp"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["sg-01a724d616e025f10", "sg-07aa3c5e0d03578d8"]
  subnets            = ["subnet-046dd081714a01fe6", "subnet-0d198315cf971b4f7"]


  tags = {
    Environment = "prod"
  }
}

resource "aws_route53_record" "prod_load_balancer" {
  zone_id      = "${data.aws_route53_zone.voxxify.zone_id}"
  name         = "prodlb.${data.aws_route53_zone.voxxify.name}"
  type         = "A"

  alias {
    name                   = "${aws_lb.lbp.dns_name}"
    zone_id                = "${aws_lb.lbp.zone_id}"
    evaluate_target_health = true
  }
}

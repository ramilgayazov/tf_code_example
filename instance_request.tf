/*
resource "aws_route53_record" "prod_api_gateway" {
  zone_id      = "${data.aws_route53_zone.voxxify.zone_id}"
  name         = "${var.env_name}${count.index + 1}-api-gateway.${data.aws_route53_zone.voxxify.name}"
  type         = "A"
  count = var.instances_count
  ttl = 300
  records = ["${element(aws_instance.prod_api_gateway.*.public_ip, count.index)}"]
}

resource "aws_instance" "prod_api_gateway" {
  count                  = var.instances_count
  ami                    = "${data.aws_ami.tf-packer5.id}"
  associate_public_ip_address = true
  subnet_id              = var.public_subnet
  instance_type          = var.instance_type_apigw
  key_name               = var.key_name
  user_data = file("user_data_apigw.sh")
  vpc_security_group_ids = var.ec2_sg_group

  tags = {
    Name = "${var.env_name}${count.index + 1}-api-gateway"
    Env  = var.env_name
  }

  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }
}
*/

resource "aws_route53_record" "prod_api_gateway" {
  zone_id      = "${data.aws_route53_zone.voxxify.zone_id}"
  name         = "api-gateway"
  type         = "A"
  count = var.instances_count
  ttl = 300
  records = ["${element(aws_instance.prod_api_gateway.*.public_ip, count.index)}"]
}

resource "aws_instance" "prod_api_gateway" {
  count                  = var.instances_count
  ami                    = "${data.aws_ami.tf-packer5.id}"
  associate_public_ip_address = true
  subnet_id              = var.public_subnet
  instance_type          = var.instance_type_apigw
  key_name               = var.key_name
  user_data = file("user_data_apigw.sh")
  vpc_security_group_ids = var.ec2_sg_group

  tags = {
    Name = "api-gateway"
    Env  = var.env_name
  }

  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }
}
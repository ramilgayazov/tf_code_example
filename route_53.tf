data "aws_route53_zone" "vox" {
  name         = "vox.com."
  private_zone = false
}

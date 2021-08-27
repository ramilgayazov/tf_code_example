data "aws_ami" "tf-packer5" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["tf-packer5-*"]
  }
}
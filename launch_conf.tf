#----- RESULT-PANEL Launch configuration --------

resource "aws_launch_configuration" "result-panel-lc" {
  name_prefix = "result-panel-lc"
  image_id = "${data.aws_ami.tf-packer5.id}"
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("user_data_result.sh")
  security_groups = var.ec2_sg_group
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  root_block_device {
          volume_type = var.root_volume_type
          volume_size = var.root_volume_size
  }
}

#----- SURVEY Launch configuration --------

resource "aws_launch_configuration" "survey-lc" {
  name_prefix = "survey-lc"
  image_id = "${data.aws_ami.tf-packer5.id}"
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("user_data_survey.sh")
  security_groups = var.ec2_sg_group
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  root_block_device {
          volume_type = var.root_volume_type
          volume_size = var.root_volume_size
  }
}

#----- ADMIN-PANEL Launch configuration --------

resource "aws_launch_configuration" "admin-panel-lc" {
  name_prefix = "admin-panel-lc"
  image_id = "${data.aws_ami.tf-packer5.id}"
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("user_data_adminpanel.sh")
  security_groups = var.ec2_sg_group
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  root_block_device {
          volume_type = var.root_volume_type
          volume_size = var.root_volume_size
  }
}
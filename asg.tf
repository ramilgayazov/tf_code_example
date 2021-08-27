#----- RESULT-PANEL ASG -----

resource "aws_autoscaling_group" "result-panel-asg" {
  name = "result-panel-asg"
  max_size = var.asg_max
  min_size = var.asg_min
  health_check_grace_period = var.asg_grace
  health_check_type = var.asg_hct
  desired_capacity = var.asg_cap
  force_delete = true
  launch_configuration = aws_launch_configuration.result-panel-lc.name
  vpc_zone_identifier = [var.public_subnet]

  tag {
    key = "Name"
    value = "result-panel"
    propagate_at_launch = true
  }

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "result_panel_target_group_attach" {
  autoscaling_group_name = aws_autoscaling_group.result-panel-asg.id
  alb_target_group_arn   = aws_lb_target_group.result_panel_target_group_prod.arn
}

#----- SURVEY ASG -----

resource "aws_autoscaling_group" "survey-asg" {
  name = "survey-asg"
  max_size = var.asg_max
  min_size = var.asg_min
  health_check_grace_period = var.asg_grace
  health_check_type = var.asg_hct
  desired_capacity = var.asg_cap
  force_delete = true
  launch_configuration = aws_launch_configuration.survey-lc.name
  vpc_zone_identifier = [var.public_subnet]

  tag {
    key = "Name"
    value = "survey"
    propagate_at_launch = true
  }

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "survey_target_group_attach" {
  autoscaling_group_name = aws_autoscaling_group.survey-asg.id
  alb_target_group_arn   = aws_lb_target_group.survey_target_group_prod.arn
}


#----- ADMIN-PANEL ASG -----

resource "aws_autoscaling_group" "admin-panel-asg" {
  name = "admin-panel-asg"
  max_size = var.asg_max
  min_size = var.asg_min
  health_check_grace_period = var.asg_grace
  health_check_type = var.asg_hct
  desired_capacity = var.asg_cap
  force_delete = true
  launch_configuration = aws_launch_configuration.admin-panel-lc.name
  vpc_zone_identifier = [var.public_subnet]

  tag {
    key = "Name"
    value = "admin-panel"
    propagate_at_launch = true
  }

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "admin_panel_target_group_attach" {
  autoscaling_group_name = aws_autoscaling_group.admin-panel-asg.id
  alb_target_group_arn   = aws_lb_target_group.admin_panel_target_group_prod.arn
}


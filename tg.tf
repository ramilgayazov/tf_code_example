#-----------Target Group Admin Panel--------
resource "aws_lb_target_group" "admin_panel_target_group_prod" {
  name     = "admin-panel-target-group-prod"
  port     = "8081"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 5
    protocol            = "HTTP"
    path                = "/"
    port                = "8081"
  }
}

#-----------Target Group Survey--------
resource "aws_lb_target_group" "survey_target_group_prod" {
  name     = "survey-target-group-prod"
  port     = "8082"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 5
    protocol            = "HTTP"
    path                = "/"
    port                = "8082"
  }
}

#-----------Target Group Result Panel--------
resource "aws_lb_target_group" "result_panel_target_group_prod" {
  name     = "result-panel-target-group-prod"
  port     = "8083"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 5
    protocol            = "HTTP"
    path                = "/"
    port                = "8083"
  }
}

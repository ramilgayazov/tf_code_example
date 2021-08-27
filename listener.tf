#-----------Listener--------
resource "aws_lb_listener" "listenerprod" {
  load_balancer_arn = aws_lb.lbp.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.admin_panel_target_group_prod.arn
    type             = "forward"

  }
}

resource "aws_alb_listener_rule" "survey" {
  listener_arn  = aws_lb_listener.listenerprod.arn
  priority      = 89

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.survey_target_group_prod.arn
  }

  condition {
    path_pattern {
      values = ["/api/survey/*"]
    }
  }
}

resource "aws_alb_listener_rule" "result" {
  listener_arn  = aws_lb_listener.listenerprod.arn
  priority      = 99

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.result_panel_target_group_prod.arn
  }

  condition {
    path_pattern {
      values = ["/api/result/*"]
    }
  }
}
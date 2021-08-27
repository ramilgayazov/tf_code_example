#----- RESULT-PANEL ASG Policy-----
# scale up alarm

resource "aws_autoscaling_policy" "result_autoscaling_policy" {
  name                   = "result_panel_autoscaling_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.result-panel-asg.name}"
  policy_type = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "result-panel-cpu-alarm" {
  alarm_name = "result-panel-cpu-alarm"
  alarm_description = "result-panel-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "60"
  dimensions = {
  "AutoScalingGroupName" = "${aws_autoscaling_group.result-panel-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.result_autoscaling_policy.arn}"]
}




# scale down alarm
resource "aws_autoscaling_policy" "result-panel-cpu-policy-scaledown" {
  name = "result-panel-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.result-panel-asg.name}"
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "-1"
  cooldown = "300"
  policy_type = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "result-panel-cpu-alarm-scaledown" {
  alarm_name = "result-panel-cpu-alarm-scaledown"
  alarm_description = "result-panel-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "20"
  dimensions = {
  "AutoScalingGroupName" = "${aws_autoscaling_group.result-panel-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.result-panel-cpu-policy-scaledown.arn}"]
}



#----- SURVEY ASG Policy-----
# scale up alarm

resource "aws_autoscaling_policy" "survey_autoscaling_policy" {
  name                   = "survey_autoscaling_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.survey-asg.name}"
  policy_type = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "survey-cpu-alarm" {
  alarm_name = "survey-cpu-alarm"
  alarm_description = "survey-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "60"
  dimensions = {
  "AutoScalingGroupName" = "${aws_autoscaling_group.survey-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.survey_autoscaling_policy.arn}"]
}



# scale down alarm
resource "aws_autoscaling_policy" "survey-cpu-policy-scaledown" {
  name = "survey-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.survey-asg.name}"
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "-1"
  cooldown = "300"
  policy_type = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "survey-cpu-alarm-scaledown" {
  alarm_name = "survey-cpu-alarm-scaledown"
  alarm_description = "survey-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "20"
  dimensions = {
  "AutoScalingGroupName" = "${aws_autoscaling_group.survey-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.survey-cpu-policy-scaledown.arn}"]
}



#----- ADMIN ASG Policy-----
# scale up alarm

resource "aws_autoscaling_policy" "admin_panel_autoscaling_policy" {
  name                   = "admin_panel_autoscaling_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.admin-panel-asg.name}"
  policy_type = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "admin-panel-cpu-alarm" {
  alarm_name = "admin-panel-cpu-alarm"
  alarm_description = "admin-panel-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "60"
  dimensions = {
  "AutoScalingGroupName" = "${aws_autoscaling_group.admin-panel-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.admin_panel_autoscaling_policy.arn}"]
}




# scale down alarm
resource "aws_autoscaling_policy" "admin-panel-cpu-policy-scaledown" {
  name = "admin-panel-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.admin-panel-asg.name}"
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "-1"
  cooldown = "300"
  policy_type = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "admin-panel-cpu-alarm-scaledown" {
  alarm_name = "admin-panel-cpu-alarm-scaledown"
  alarm_description = "admin-panel-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "20"
  dimensions = {
  "AutoScalingGroupName" = "${aws_autoscaling_group.admin-panel-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.admin-panel-cpu-policy-scaledown.arn}"]
}
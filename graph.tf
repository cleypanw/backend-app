resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "5ae39d34-fa4c-4ed4-93fa-baabb5aa858a"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "325a2d3a-fcb4-45c5-8a00-fe97f857d86d"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "2133c751-20ce-4b39-9277-61862fa5df6c"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "20ff29dd-6e33-4423-b75f-bb1f01069410"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "cd54386a-0c79-4023-bd4e-19f59f77c735"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "f4adffec-cb9d-43d5-be4d-b62bd689e9af"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "0d383d89-02d9-4079-86eb-1119d2068e26"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "22a0b2a5-4463-4aeb-87be-180e9487f39f"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "d55996c0-4211-484a-a4c1-bb355bd1b04b"
  }
}
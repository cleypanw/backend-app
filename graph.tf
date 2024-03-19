resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "ffa2fc03-8a85-4ca9-8d4b-1dbfdf8f076f"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "c6d773ef-c831-4fb3-9641-8f96b1528d12"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "9a61b1ec-b69a-4aae-b10c-d62620f677ff"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "a4fd2fe6-b5d8-48ac-8a0d-f31f3bcc8c32"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "73b32aa3-fe67-4ca3-bcf3-a8c5a0679313"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "e0086ac4-ff30-4f98-9f1b-d073568aac97"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "a584f095-38aa-47a5-9320-51e37e467cd7"
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
    yor_trace = "8e20c9cb-89bb-4a9a-8511-f0c587cd8a74"
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
    yor_trace = "1cdab973-045c-480b-824d-4c374afccc3f"
  }
}
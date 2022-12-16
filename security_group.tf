resource "aws_security_group" "this" {
  name_prefix = var.git
  vpc_id      = var.vpc_id
  tags        = merge(local.tags, var.tags)

  ingress {
    description = "self"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    description = "internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
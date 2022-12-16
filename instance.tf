data "aws_ami" "this" {
  most_recent = true
  owners      = var.ami_filter_owners

  filter {
    name   = "name"
    values = var.ami_filter_name
  }

  filter {
    name   = "virtualization-type"
    values = var.ami_filter_virtualization_type
  }
}

resource "aws_instance" "this" {
  ami                     = data.aws_ami.this.id
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = flatten([aws_security_group.this.id, var.vpc_security_group_ids])
  tags                    = merge(local.tags, var.tags)
  volume_tags             = merge(local.tags, var.tags)
  disable_api_termination = var.disable_api_termination
  ebs_optimized           = var.ebs_optimized
  hibernation             = var.hibernation
  monitoring              = var.monitoring

  user_data = templatefile("${path.module}/user_data.tpl", {
    actions_runner_linux_download_url = var.actions_runner_linux_download_url
    github_repo_url                   = var.github_repo_url
    github_runner_token               = var.github_runner_token
  })

  root_block_device {
    volume_size           = var.root_block_device_volume_size
    delete_on_termination = true
  }
}
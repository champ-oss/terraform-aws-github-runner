terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

data "aws_vpcs" "this" {
  tags = {
    purpose = "vega"
  }
}

data "aws_subnets" "private" {
  tags = {
    purpose = "vega"
    Type    = "Private"
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.this.ids[0]]
  }
}

locals {
  git = "terraform-aws-github-runner"
  tags = {
    git     = local.git
    cost    = "shared"
    creator = "terraform"
  }
}

module "this" {
  source              = "../../"
  git                 = local.git
  github_repo_url     = "https://github.com/champ-oss/terraform-aws-github-runner"
  github_runner_token = "abc123"
  subnet_id           = data.aws_subnets.private.ids[0]
  tags                = local.tags
  vpc_id              = data.aws_vpcs.this.ids[0]
}

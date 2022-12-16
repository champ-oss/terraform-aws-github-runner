variable "actions_runner_linux_download_url" {
  description = "https://github.com/actions/runner/releases"
  type        = string
  default     = "https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz"
}

variable "ami_filter_name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#filter"
  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}

variable "ami_filter_virtualization_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#filter"
  type        = list(string)
  default     = ["hvm"]
}

variable "ami_filter_owners" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#owners"
  type        = list(string)
  default     = ["099720109477"] # Canonical
}

variable "associate_public_ip_address" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#associate_public_ip_address"
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#disable_api_termination"
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#ebs_optimized"
  type        = bool
  default     = true
}

variable "git" {
  description = "Identifier to be used on all resources"
  type        = string
}

variable "github_repo_url" {
  description = "URL of GitHub repo the runner will be used for"
  type        = string
}

variable "github_runner_token" {
  description = "Token for GitHub runner which is created from the repo settings"
  type        = string
}

variable "hibernation" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#hibernation"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#instance_type"
  type        = string
  default     = "m5.large"
}

variable "monitoring" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#monitoring"
  type        = bool
  default     = false
}

variable "root_block_device_volume_size" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#volume_size"
  type        = number
  default     = 500
}

variable "subnet_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#subnet_id"
  type        = string
}

variable "tags" {
  description = "https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#vpc_security_group_ids"
  type        = list(string)
  default     = []
}
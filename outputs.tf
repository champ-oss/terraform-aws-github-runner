output "aws_region" {
  description = "AWS Region Name"
  value       = data.aws_region.this.name
}
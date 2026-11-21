terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}



resource "aws_iam_user" "s3_user" {
  name = var.iam_username


  tags = {
    Project     = var.project_name
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "${var.project_name}-s3-read-policy"
  description = "Provide read-only access to Amazon s3"

  policy = jsonencode(var.s3_read_policy)
}

resource "aws_iam_user_policy_attachment" "s3_read_attachment" {
  user       = aws_iam_user.s3_user.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}



variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "iam-automation"
}

variable "iam_username" {
  description = "IAM user to be created"
  type        = string
  default     = "s3-read-hrishiraj"
}

variable "s3_read_policy" {
  description = "S3 read-only IAM policy"
  type        = any


  default = {
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets"
        ]
        Resource = [
          "*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "arn:aws:s3:::*/*"
        ]
      }
    ]
  }
}

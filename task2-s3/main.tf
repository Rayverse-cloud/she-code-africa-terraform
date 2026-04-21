terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "app_backup" {
  bucket = "app-backup-bucket-ray-sca-2026"

  tags = {
    Name  = "app-backup-bucket"
    Owner = "Ray"
  }
}

resource "aws_s3_bucket_versioning" "app_backup_versioning" {
  bucket = aws_s3_bucket.app_backup.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.app_backup.bucket
  description = "The name of the backup S3 bucket"
}
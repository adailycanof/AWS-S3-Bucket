resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = var.versioning
  }


  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "/log"
  }


  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 180
    }
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "adcox10"
  acl    = "log-delivery-write"
}

#   tags = merge(
#        var.default_tags,
#        {
#            "Shared-Module" = replace
#        }
#    )
#}

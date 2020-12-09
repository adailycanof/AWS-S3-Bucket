resource "aws_s3_bucket_public_access_block" "deny_public" {
  bucket              = aws_s3_bucket.bucket.id
  block_public_acls   = true
  block_public_policy = true
  depends_on = [aws_s3_bucket_policy.policy]
}
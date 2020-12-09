resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bucket.id
  depends_on = [aws_s3_bucket.bucket]

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "123",
    "Statement": [
      {
        "Sid": "",
        "Effect": "Deny",
        "Principal": "*",
        "Action": "s3:*",
        "Resource": "arn:aws:s3:::BUCKET_NAME_HERE",
        "Condition": {"StringNotEquals": {"aws:RequestedRegion": "eu-west-2" }}
       },
       {
        "Sid": "",
        "Effect": "Deny",
        "Principal": "*",
        "Action": "s3:*",
        "Resource": "arn:aws:s3:::BUCKET_NAME_HERE",
        "Condition": {"StringNotEquals": {"aws:RequestedRegion": "eu-west-2" }}
       }
    ]  
 }
POLICY
}
resource "aws_s3_bucket" "content" {
  bucket = format("%s-indices", var.project_name)

  tags = {
    Name    = format("%s-indices", var.project_name)
  }

}

resource "aws_s3_bucket_versioning" "content" {
  bucket = aws_s3_bucket.content.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "content" {
  bucket = aws_s3_bucket.content.id
  acl    = "public-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "content" {
  bucket = aws_s3_bucket.content.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.main.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

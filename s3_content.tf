resource "aws_s3_bucket" "content" {
  bucket = format("%s-indices", var.project_name)

  versioning {
    enabled = true
  }

  tags = {
    Name    = format("%s-indices", var.project_name)
    Project = "EconomiaPopular"
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

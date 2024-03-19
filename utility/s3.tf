#Secret S3 Bucket
resource "aws_s3_bucket" "aattack-path-secret-s3-bucket" {
  bucket        = "aattack-path-secret-s3-bucket-${var.ebillingid}"
  force_destroy = true
  tags = {
    Name        = "aattack-path-secret-s3-bucket-${var.ebillingid}"
    Description = "ebilling ${var.ebillingid} S3 Bucket used for storing a secret"
    Stack       = "${var.stack-name}"
    Scenario    = "${var.scenario-name}"
    yor_trace   = "455bb5a7-29b4-41b3-a34a-070b66e2b406"
  }
}

resource "aws_s3_bucket_object" "aattack-path-shepards-credentials" {
  bucket = "${aws_s3_bucket.aattack-path-secret-s3-bucket.id}"
  key    = "admin-user.txt"
  source = "./admin-user.txt"
  tags = {
    Name      = "aattack-path-shepards-credentials-${var.ebillingid}"
    Stack     = "${var.stack-name}"
    Scenario  = "${var.scenario-name}"
    yor_trace = "42e1965b-43fc-4ac9-8e92-d9661fd5f39e"
  }
}

data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket" "finance-secret-s3-bucket" {
  bucket        = "finance-secret-${var.ebillingid}"
  force_destroy = true
  tags = {
    Name        = "finance-secret-${var.ebillingid}"
    Description = "ebilling ${var.ebillingid} S3 Bucket used for storing a secret"
    Stack       = "${var.stack-name}"
    Scenario    = "${var.scenario-name}"
    yor_trace   = "f2d8374f-b314-4223-a477-a8102b76e291"
  }
}

resource "aws_s3_bucket_ownership_controls" "finance-bucket_ownership_controls" {
  bucket = aws_s3_bucket.finance-secret-s3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "finance-bucket_public_access_block" {
  bucket = aws_s3_bucket.finance-secret-s3-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "finance-bucket_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.finance-bucket_ownership_controls,
    aws_s3_bucket_public_access_block.finance-bucket_public_access_block,
  ]

  bucket = aws_s3_bucket.finance-secret-s3-bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "s3_public_objects" {
  bucket        = "${aws_s3_bucket.finance-secret-s3-bucket.id}"
  force_destroy = true
  tags = {
    Name        = "finance-secret-s3-bucket-${var.ebillingid}-public"
    Description = "ebilling ${var.ebillingid} S3 Bucket used for storing a secret"
    Stack       = "${var.stack-name}"
    Scenario    = "${var.scenario-name}"
    yor_trace   = "74e2c029-d9b3-42b0-9f97-99cddecbc2a2"
  }
  key          = "admin-user.txt"
  source       = "./admin-user.txt"
  content_type = "text/plain"
}
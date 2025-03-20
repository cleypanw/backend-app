resource "aws_s3_bucket" "default" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }
  tags = {
    yor_trace = "27b33581-b1c9-455c-aad6-14411be6dbec"
  }
}
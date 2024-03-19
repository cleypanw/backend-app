module "learn_terraform" {
  source  = "https://github.com/hashicorp/learn-terraform-provision-eks-cluster.git"
  version = "1.16.0"

  name = "s3-bucket"
}

resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  versioning {
    enabled = var.enabled
  }
  tags = {
    yor_trace = "ca11a8b9-32d7-4a8a-baa9-1e859be16458"
  }
}
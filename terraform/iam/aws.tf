variable "region" {
  default = "us-east-1"
}

provider "aws" {
  region = "${var.region}"
}

variable "iam_state_bucket_name" {
  default = "terraform_state_iam"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote_iam_state_bucket" {
  bucket = "${var.iam_state_bucket_name}_${data.aws_caller_identity.current.account_id}"
  acl    = "private"
  region = "us-east-1"

  versioning {
    enabled = true
  }
}

output "rmeote_state_bucket" {
  value = "${aws_s3_bucket.remote_iam_state_bucket.bucket}"
}

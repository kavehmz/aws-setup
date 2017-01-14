variable "region" {
  default = "us-east-1"
}

provider "aws" {
  region = "${var.region}"
}

variable "terraform_profile" {
  default = "terraform"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "rmeote_state_bucket" {
  bucket = "${data.aws_caller_identity.current.account_id}_${var.terraform_profile}_state"
  acl    = "private"

  versioning {
    enabled = true
  }

  force_destroy = true
}

output "rmeote_state_bucket" {
  value = "${aws_s3_bucket.rmeote_state_bucket.bucket}"
}

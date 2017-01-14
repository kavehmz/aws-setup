data "aws_iam_policy_document" "policy_assume_empty" {
  statement {
    actions = ["sts:AssumeRole"]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }

    principals {
      type        = "AWS"
      identifiers = []
    }
  }
}

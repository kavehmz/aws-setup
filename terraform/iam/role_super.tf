resource "aws_iam_role" "super" {
  name               = "super"
  assume_role_policy = "${data.aws_iam_policy_document.policy_assume_all.json}"
}

resource "aws_iam_role_policy_attachment" "super-iam-full-attach" {
  role       = "${aws_iam_role.super.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role_policy" "iam_s3_bucket_policy" {
  name = "iam_s3_bucket_policy"
  role = "${aws_iam_role.super.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::terraform_state_iam*"
    }
  ]
}
EOF
}

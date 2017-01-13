resource "aws_iam_role" "write" {
  name = "write"

  assume_role_policy = "${data.aws_iam_policy_document.policy_assume_all.json}"
}

resource "aws_iam_role_policy_attachment" "write-ec2-attach" {
  role       = "${aws_iam_role.write.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "write-s3-attach" {
  role       = "${aws_iam_role.write.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "write-workspace-attach" {
  role       = "${aws_iam_role.write.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin"
}

resource "aws_iam_role_policy_attachment" "write-deny-delete-attach" {
  role       = "${aws_iam_role.write.name}"
  policy_arn = "${aws_iam_policy.deny_delete.arn}"
}

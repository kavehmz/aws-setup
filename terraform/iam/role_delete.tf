resource "aws_iam_role" "delete" {
  name               = "delete"
  assume_role_policy = "${data.aws_iam_policy_document.policy_assume_delete.json}"
}

resource "aws_iam_role_policy_attachment" "delete-ec2-attach" {
  role       = "${aws_iam_role.delete.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "delete-s3-attach" {
  role       = "${aws_iam_role.delete.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "delete-workspace-attach" {
  role       = "${aws_iam_role.delete.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin"
}

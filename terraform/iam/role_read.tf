resource "aws_iam_role" "read" {
  name               = "read"
  assume_role_policy = "${data.aws_iam_policy_document.policy_assume_all.json}"
}

resource "aws_iam_role_policy_attachment" "read-attach" {
  role       = "${aws_iam_role.read.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

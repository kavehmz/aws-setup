resource "aws_iam_role" "super" {
  name               = "super"
  assume_role_policy = "${data.aws_iam_policy_document.policy_assume_all.json}"
}

resource "aws_iam_role_policy_attachment" "super-attach" {
  role       = "${aws_iam_role.super.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

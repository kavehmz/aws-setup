resource "aws_iam_group" "users" {
  name = "users"
}

resource "aws_iam_group_policy_attachment" "attach_users_group" {
  group      = "${aws_iam_group.users.id}"
  policy_arn = "${aws_iam_policy.users.arn}"
}

resource "aws_iam_group_membership" "users" {
  name = "users-group-membership"

  users = [
    "${aws_iam_user.kaveh.name}",
  ]

  group = "${aws_iam_group.users.name}"
}

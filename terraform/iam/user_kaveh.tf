resource "aws_iam_user" "kaveh" {
  name          = "kaveh"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "kaveh" {
  user    = "${aws_iam_user.kaveh.name}"
  pgp_key = "keybase:kavehmz"
}

output "kaveh_password" {
  value = "${aws_iam_user_login_profile.kaveh.encrypted_password}"
}

resource "aws_iam_policy" "deny_delete" {
  name = "deny_delete"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1483029401000",
            "Effect": "Deny",
            "Action": [
                "ec2:*"
            ],
            "Condition": {
                "StringLike": {
                    "ec2:ResourceTag/State": "Eternal"
                }
            },
            "Resource": [
                "arn:aws:ec2::*"
            ]
        },
        {
            "Sid": "Stmt1483029401001",
            "Effect": "Deny",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::eternal*"
            ]
        },
        {
            "Sid": "Stmt1483029401002",
            "Effect": "Deny",
            "Action": [
                "workspaces:DeleteTags",
                "workspaces:TerminateWorkspaces"
            ],
            "Resource": [
                "*"
            ],
            "Condition": {
                "StringLike": {
                    "ec2:ResourceTag/State": "Eternal"
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_policy" "users" {
  name = "users"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1483900802000",
            "Effect": "Allow",
            "Action": [
                "iam:GetRoles",
                "iam:GetRolePolicy",
                "iam:ListRoles"
            ],
            "Resource": [
                "arn:aws:iam::*"
            ]
        },
        {
            "Sid": "AllowAllUsersToListAccounts",
            "Effect": "Allow",
            "Action":[
                "iam:ListAccountAliases",
                "iam:ListUsers",
                "iam:GetAccountSummary"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowIndividualUserToSeeAndManageTheirOwnAccountInformation",
            "Effect": "Allow",
            "Action":[
                "iam:ChangePassword",
                "iam:CreateAccessKey",
                "iam:CreateLoginProfile",
                "iam:DeleteAccessKey",
                "iam:DeleteLoginProfile",
                "iam:GetAccountPasswordPolicy",
                "iam:GetLoginProfile",
                "iam:ListAccessKeys",
                "iam:UpdateAccessKey",
                "iam:UpdateLoginProfile",
                "iam:ListSigningCertificates",
                "iam:DeleteSigningCertificate",
                "iam:UpdateSigningCertificate",
                "iam:UploadSigningCertificate",
                "iam:ListSSHPublicKeys",
                "iam:GetSSHPublicKey",
                "iam:DeleteSSHPublicKey",
                "iam:UpdateSSHPublicKey",
                "iam:UploadSSHPublicKey"
            ],
            "Resource": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"
        },
        {
            "Sid": "AllowIndividualUserToListTheirOwnMFA",
            "Effect": "Allow",
            "Action":[
                "iam:ListVirtualMFADevices",
                "iam:ListMFADevices"
            ],
            "Resource":[
                "arn:aws:iam::${data.aws_caller_identity.current.account_id}:mfa/*",
                "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"
            ]
        },
        {
            "Sid": "AllowIndividualUserToManageTheirOwnMFA",
            "Effect": "Allow",
            "Action":[
                "iam:CreateVirtualMFADevice",
                "iam:DeactivateMFADevice",
                "iam:DeleteVirtualMFADevice",
                "iam:RequestSmsMfaRegistration",
                "iam:FinalizeSmsMfaRegistration",
                "iam:EnableMFADevice",
                "iam:ResyncMFADevice"
            ],
            "Resource":[
                "arn:aws:iam::${data.aws_caller_identity.current.account_id}:mfa/$${aws:username}",
                "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"
            ]
        }
    ]
}
EOF
}

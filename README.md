# aws-setup

We need just few roles
 - read : This will be our main daily role. Getting info from aws parts, read s3 files,..
 - write : Creating instances and adding files to s3. No remove or terminate.
 - delete : Terminating instance and removing files. Not if they are marked as eternal.
 - ampute: Deleting and removing eternals (No one is in this trust list)
 - supervise: Modify trust policy (who has access to what)

| Role          | members   | userman | read | write | delete | ampute |
| ------------- |:---------:|:-------:|:----:|:-----:| :-----:| ------:|
| supervise     | head      | YES     |      |       |        |        |
| read          | all       |         | YES  |       |        |        |
| write         | all       |         | YES  | YES   |        |        |
| delete        | empty     |         | YES  | YES   | YES    |        |
| amputate      | empty     |         | YES  | YES   | YES    | YES    |

In command-line we will use these roles like:

```bash
$ source <(curl -s https://raw.githubusercontent.com/kavehmz/dev/master/home/share/aws_assumerole.sh)

$ assume -p qa list
arn:aws:iam::999999999999:role/supervise
arn:aws:iam::999999999999:role/amputate
arn:aws:iam::999999999999:role/delete
arn:aws:iam::999999999999:role/write
arn:aws:iam::999999999999:role/read


# Notice using 2FA will reduce risk of mixing evenironments even further.
# Also our access will expure in one hour
$ assume -p qa read kaveh 647895
Assuming role of arn:aws:iam::999999999999:role/read until [2016-12-29T18:44:20Z]

# Wrong 2FA and my Token is useless
$ assume -p qa read kaveh 111111
An error occurred (AccessDenied) when calling the AssumeRole operation: MultiFactorAuthentication failed with invalid MFA one time pass code. 
Fail to assume the role

# Not in trust list and I can't assume the role
$ assume -p qa amputate kaveh 022405
An error occurred (AccessDenied) when calling the AssumeRole operation: User: arn:aws:iam::999999999999:user/kaveh is not authorized to perform: sts:AssumeRole on resource: arn:aws:iam::999999999999:role/amputate
Fail to assume the role

```

Please notice that:
- First draft is about deciding about roles.
- We should not need any group.
- We should not end up with many roles otherwise we are doing it wrong.
- This way of using Role/2FA/Assuming Role is a best practice in AWS.
- This way of using aws-cli to define resource is not a best practice. We eventually need to decide about using Terraform or CloudFormation.

Links
- http://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html

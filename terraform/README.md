# Init

Create an amazon account. Create a user named "init" with IAMFullAccess and AmazonS3FullAccess permissions.

This user is just used for initializing the setup.

Create an access key for user "init" and setup your [terraform](https://www.terraform.io/intro/getting-started/install.html).

First step is applying "iam" setup. "iam" is a account wdie setup.

```bash
$ cd iam
$ terraform plan
# If it looks OK
$ terraform apply
```

Each section will have its own state as a best practice, so does "iam". It is better to set it as remote state.

```bash
$ cd iam
$ terraform remote config \
    -backend=s3 \
    -backend-config="bucket=$(terraform output remote_iam_state_bucket)" \
    -backend-config="key=iam/terraform.tfstate" \
    -backend-config="region=us-east-1"
```

After this point remote pull/push will sync the state with s3 remote bucket and plan/apply/.. commands will automatically use the remote state you setup.

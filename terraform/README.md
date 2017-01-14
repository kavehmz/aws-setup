# Init

Create an amazon account and there create a user named "init" with IAMFullAccess and AmazonS3FullAccess policy.

This user is just used for initializing the process.

Create access key for user "init" and setup your [terraform](https://www.terraform.io/intro/getting-started/install.html).

Apply "iam" to init the users and required s3 for remote state.

```bash
$ cd iam
$ terraform plan
# If it looks OK
$ terraform apply
```

Then setup the terraform remote state.

```bash
$ cd iam
$ terraform remote config \
    -backend=s3 \
    -backend-config="bucket=$(terraform output rmeote_state_bucket)" \
    -backend-config="key=iam/terraform.tfstate" \
    -backend-config="region=us-east-1"
```

After this point remote pull/push will sync the state with s3 remote bucket and plan/apply/.. commands will automatically use the remote state you setup.


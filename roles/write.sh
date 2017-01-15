. common.sh
ROLE_NAME=write
TRUST_POLICY=all
POLICY_FILE=$(create_trust_policy $TRUST_POLICY)


aws iam create-role --role-name $ROLE_NAME --assume-role-policy-document file:///$POLICY_FILE

aws iam attach-role-policy --role-name $ROLE_NAME --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
aws iam attach-role-policy --role-name $ROLE_NAME --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam attach-role-policy --role-name $ROLE_NAME --policy-arn arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin

aws iam put-role-policy --role-name $ROLE_NAME --policy-name deny_amputation --policy-document file:///$(scriptpath)/access/deny_amputation.json
aws iam put-role-policy --role-name $ROLE_NAME --policy-name deny_delete --policy-document file:///$(scriptpath)/access/deny_delete.json

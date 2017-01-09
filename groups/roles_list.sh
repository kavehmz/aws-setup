GROUP_NAME=roles_list

aws iam create-group --group-name $GROUP_NAME
aws iam put-group-policy --group-name $GROUP_NAME --policy-document file://roles_list.json --policy-name roles_list
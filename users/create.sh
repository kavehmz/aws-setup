USER_NAME=$1

aws iam create-user --user-name $USER_NAME
aws iam add-user-to-group --user-name $USER_NAME --group-name roles_list

# create-login-profile.json is create usign the following command
# aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json 
aws iam create-login-profile --cli-input-json file://create-login-profile.json


create_trust_policy() {
    local TRUST_POLICY=$1
    SCRIPTPATH=$(scriptpath)
    AWS_ACCOUNT_ID=$(aws sts get-caller-identity --output text --query 'Account')

    local FILE=$(mktemp)
    cat $SCRIPTPATH/trust/$TRUST_POLICY.json|sed -e "s/999999999999/$AWS_ACCOUNT_ID/g" > $FILE

    echo -n $FILE
}

scriptpath() {
    echo -n $(cd $(dirname $0);pwd -P)
}
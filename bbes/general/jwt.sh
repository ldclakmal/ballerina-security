mkdir bbe
mkdir bbe/tests
touch bbe/Ballerina.toml
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/security-jwt-issue-validate/security_jwt_issue_validate.bal -o bbe/jwt.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/security-jwt-issue-validate/tests/security_jwt_issue_validate_test.bal -o bbe/tests/jwt_test.bal
sed -i 's+../resource/path/to+resources+g' bbe/jwt.bal
bal build bbe

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/jwt_issue_validate.bal > packages/bbe/security/jwt/jwt_issue_validate.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/tests/jwt_issue_validate_test.bal > packages/bbe/security/jwt/tests/jwt_issue_validate_test.bal

sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/security/jwt/jwt_issue_validate.bal

bal build packages/bbe/security/jwt

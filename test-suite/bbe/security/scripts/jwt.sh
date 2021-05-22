curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/jwt_issue_validate.bal > packages/jwt/jwt_issue_validate.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/tests/jwt_issue_validate_test.bal > packages/jwt/tests/jwt_issue_validate_test.bal

sed -i 's+../resource/path/to+resources+g' packages/jwt/jwt_issue_validate.bal

bal build packages/jwt

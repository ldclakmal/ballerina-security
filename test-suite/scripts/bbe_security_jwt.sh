curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/jwt_issue_validate.bal > packages/bbe.security.jwt/jwt_issue_validate.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/tests/jwt_issue_validate_test.bal > packages/bbe.security.jwt/tests/jwt_issue_validate_test.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/jwt-issue-validate/jwt_mock_server.bal > packages/bbe.security.jwt/jwt_mock_server.bal

sed -i 's+../resource/path/to+resources+g' packages/bbe.security.jwt/jwt_issue_validate.bal
sed -i 's+../resource/path/to+resources+g' packages/bbe.security.jwt/jwt_mock_server.bal

bal build packages/bbe.security.jwt

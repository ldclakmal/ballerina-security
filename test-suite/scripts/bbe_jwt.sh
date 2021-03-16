curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/vswan-lake-alpha2/examples/jwt-issue-validate/jwt_issue_validate.bal > packages/bbe.jwt/jwt_issue_validate.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/vswan-lake-alpha2/examples/jwt-issue-validate/tests/jwt_issue_validate_test.bal > packages/bbe.jwt/tests/jwt_issue_validate_test.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/vswan-lake-alpha2/examples/jwt-issue-validate/jwt_mock_server.bal > packages/bbe.jwt/jwt_mock_server.bal

sed -i 's+../resource/path/to/+resources+g' packages/bbe.jwt/jwt_issue_validate.bal
sed -i 's+../resource/path/to/+resources+g' packages/bbe.jwt/jwt_mock_server.bal

bal build packages/bbe.jwt

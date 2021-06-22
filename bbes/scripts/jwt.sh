source scripts/common.sh

mkdir jwt
mkdir jwt/tests
echo '[package]
org = "ldclakmal"
name = "jwt"
version = "1.0.0"' > jwt/Ballerina.toml
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/security-jwt-issue-validate/security_jwt_issue_validate.bal -o jwt/jwt.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/security-jwt-issue-validate/tests/security_jwt_issue_validate_test.bal -o jwt/tests/jwt_test.bal
sed -i 's+../resource/path/to+resources+g' jwt/jwt.bal
bal build jwt

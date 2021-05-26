mkdir crypto
mkdir crypto/tests
echo '[package]
org = "ldclakmal"
name = "crypto"
version = "1.0.0"' > crypto/Ballerina.toml
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/security-crypto/security_crypto.bal -o crypto/crypto.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/security-crypto/tests/security_crypto_test.bal -o crypto/tests/crypto_test.bal
sed -i 's+../resource/path/to+resources+g' crypto/crypto.bal
bal build crypto

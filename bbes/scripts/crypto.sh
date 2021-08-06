source scripts/common.sh

mkdir bbe
mkdir bbe/tests
touch bbe/Ballerina.toml
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/security-crypto/security_crypto.bal -o bbe/crypto.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/security-crypto/tests/security_crypto_test.bal -o bbe/tests/crypto_test.bal
sed -i 's+../resource/path/to+resources+g' bbe/crypto.bal
bal build bbe

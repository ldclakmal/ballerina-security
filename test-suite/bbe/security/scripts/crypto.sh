curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/crypto/crypto.bal > packages/crypto/crypto.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/crypto/tests/crypto_test.bal > packages/crypto/tests/crypto_test.bal

sed -i 's+../resource/path/to+resources+g' packages/crypto/crypto.bal

bal build packages/crypto

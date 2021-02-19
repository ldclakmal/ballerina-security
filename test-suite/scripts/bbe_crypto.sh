curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/crypto/crypto.bal > packages/bbe.crypto/crypto.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/crypto/tests/crypto_test.bal > packages/bbe.crypto/tests/crypto_test.bal

sed -i 's+../resources+resources+g' packages/bbe.crypto/crypto.bal

bal build packages/bbe.crypto

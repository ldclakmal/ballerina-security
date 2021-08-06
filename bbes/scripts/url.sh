source scripts/common.sh

mkdir bbe
mkdir bbe/tests
touch bbe/Ballerina.toml
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/url-encode-decode/url_encode_decode.bal -o bbe/url.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/url-encode-decode/tests/url_encode_decode_test.bal -o bbe/tests/url_test.bal
bal build bbe

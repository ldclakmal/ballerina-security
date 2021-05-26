mkdir url
mkdir url/tests
echo '[package]
org = "ldclakmal"
name = "url"
version = "1.0.0"' > url/Ballerina.toml
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/url-encode-decode/url_encode_decode.bal -o url/url.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/url-encode-decode/tests/url_encode_decode_test.bal -o url/tests/url_test.bal
bal build url

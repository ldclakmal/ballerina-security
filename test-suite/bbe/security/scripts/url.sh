curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/url-encode-decode/url_encode_decode.bal > packages/bbe/security/url/url.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/url-encode-decode/tests/url_encode_decode_test.bal > packages/bbe/security/url/tests/url_test.bal

bal build packages/bbe/security/url

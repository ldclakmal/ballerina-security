curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/url-encode-decode/url_encode_decode.bal > packages/url/url.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/url-encode-decode/tests/url_encode_decode_test.bal > packages/url/tests/url_test.bal

bal build packages/url

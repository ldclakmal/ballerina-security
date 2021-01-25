curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/url-encode-decode/url_encode_decode.bal > packages/encoding/encoding.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/url-encode-decode/tests/url_encode_decode_test.bal > packages/encoding/tests/encoding_test.bal

bal build packages/encoding

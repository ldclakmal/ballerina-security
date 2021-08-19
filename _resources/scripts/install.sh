artifact_id=$1
if [[ -z $artifact_id ]]; then
  wget $BALLERINA_DOWNLOAD_HOST/downloads/$BALLERINA_VERSION/ballerina-linux-installer-x64-$BALLERINA_VERSION.deb
  sudo dpkg -i ballerina-linux-installer-x64-$BALLERINA_VERSION.deb
  sudo apt-get install -f
  bal -v
else
  if curl -kv -L -X GET 'https://api.github.com/repos/ballerina-platform/ballerina-distribution/actions/artifacts/'"$artifact_id"'/zip' -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: Bearer '"$GITHUB_TOKEN"'' -o ballerina.zip; then
    unzip -q ballerina.zip
    unzip -q ballerina-swan-lake-*.zip
    rm -r ballerina*.zip
    directory=$(ls | grep ballerina-swan-lake-*)
    $GITHUB_WORKSPACE/$directory/bin/bal -v
    echo "$GITHUB_WORKSPACE/$directory/bin" >> $GITHUB_PATH
  fi
fi

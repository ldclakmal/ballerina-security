artifact_id=$1
if [[ -z $artifact_id ]]; then
  wget $BALLERINA_DEB_URL
  sudo dpkg -i ${BALLERINA_DEB_URL##*/}
  sudo apt-get install -f
  bal -v
else
  if curl -k -L -X GET 'https://api.github.com/repos/ballerina-platform/ballerina-distribution/actions/artifacts/'"$artifact_id"'/zip' -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: Bearer '"$GITHUB_TOKEN"'' -o ballerina.zip; then
    unzip -q ballerina.zip
    unzip -q ballerina-2201.*.zip
    rm -r ballerina*.zip
    directory=$(ls | grep ballerina-2201.*)
    $GITHUB_WORKSPACE/$directory/bin/bal -v
    echo "$GITHUB_WORKSPACE/$directory/bin" >> $GITHUB_PATH
  fi
fi

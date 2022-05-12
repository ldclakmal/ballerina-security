if [[ ! -z $BALLERINA_DEB_URL ]]; then
  echo 'Installing Ballerina using the provided BALLERINA_DEB_URL...'
  wget -q $BALLERINA_DEB_URL
  sudo dpkg -i ${BALLERINA_DEB_URL##*/}
  sudo apt-get install -f
  bal -v
elif [[ ! -z $BALLERINA_ARTIFACT_ID ]]; then
  echo 'Installing Ballerina using the provided BALLERINA_ARTIFACT_ID...'
  if curl -k -L -X GET 'https://api.github.com/repos/ballerina-platform/ballerina-distribution/actions/artifacts/'"$BALLERINA_ARTIFACT_ID"'/zip' -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: Bearer '"$GITHUB_TOKEN"'' -o ballerina.zip; then
    unzip -q ballerina.zip
    unzip -q ballerina-2201.*.zip
    rm -r ballerina*.zip
    directory=$(ls | grep ballerina-2201.*)
    $GITHUB_WORKSPACE/$directory/bin/bal -v
    echo "$GITHUB_WORKSPACE/$directory/bin" >> $GITHUB_PATH
  fi
else
  echo 'Installing Ballerina using the provided RELEASED_BALLERINA_DEB_URL...'
  wget -q $RELEASED_BALLERINA_DEB_URL
  sudo dpkg -i ${RELEASED_BALLERINA_DEB_URL##*/}
  sudo apt-get install -f
  bal -v
fi

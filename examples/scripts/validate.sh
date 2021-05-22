assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertTextPayload() {
  if [[ "${1} ${2}" != "\"Hello, World!\"" ]]; then
    exit 1
  fi
}

assertJsonPayload() {
  if [[ ${1} != "\"{\"data\":{\"bar\":\"Hello, World!\"}}\"" ]]; then
    exit 1
  fi
}

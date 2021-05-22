assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertTextPayload() {
  if [[ "${1} ${2}" != "Hello, World!" ]]; then
    echo "Expected: 'Hello, World!'"
    echo "Actual: '${1} ${2}'"
    exit 1
  fi
}

assertJsonPayload() {
  if [[ "${1} ${2}" != "{\"data\":{\"bar\":\"Hello, World!\"}}" ]]; then
    echo "Expected: '{\"data\":{\"bar\":\"Hello, World!\"}}'"
    echo "Actual: '${1} ${2}'"
    exit 1
  fi
}

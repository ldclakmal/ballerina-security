assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertAuthnFailure() {
  if [[ $2 != "401" ]]; then
    echo "Expected: '401'"
    echo "Actual: '${2}'"
    exit 1
  fi
}

assertAuthzFailure() {
  if [[ $2 != "403" ]]; then
    echo "Expected: '403'"
    echo "Actual: '${2}'"
    exit 1
  fi
}

assertSuccess() {
  if [[ $2 != "200" ]]; then
    echo "Expected: '200'"
    echo "Actual: '${2}'"
    exit 1
  fi
}

assertStatusCode() {
  if [[ ${12} != "\"200\"" ]]; then
    echo "Expected: '\"200\"'"
    echo "Actual: '${12}'"
    exit 1
  fi
}

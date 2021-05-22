assertNotEmpty() {
  if [ -z "$1" ]; then
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

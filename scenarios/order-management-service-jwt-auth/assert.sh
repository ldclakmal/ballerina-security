assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertEquals() {
  if [[ $1 != $2 ]]; then
    echo "Expected: '$2'"
    echo "Actual: '$1'"
    exit 1
  fi
}

assertUnauthorized() {
  if [[ $1 != "HTTP/1.1 401 Unauthorized" ]]; then
    echo "Expected: 'HTTP/1.1 401 Unauthorized'"
    echo "Actual: '$1'"
    exit 1
  fi
}

assertForbidden() {
  if [[ $1 != "HTTP/1.1 403 Forbidden" ]]; then
    echo "Expected: 'HTTP/1.1 403 Forbidden'"
    echo "Actual: '$1'"
    exit 1
  fi
}

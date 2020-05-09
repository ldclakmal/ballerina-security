assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertAuthnFailure() {
  if [[ $1 != *"Authentication"* ]]; then
    exit 1
  fi
}

assertAuthzFailure() {
  if [[ $1 != *"Authorization"* ]]; then
    exit 1
  fi
}

assertSuccess() {
  if [[ $1 == *"items"* ]]; then
    exit 0
  fi
  exit 1
}

assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertAuthnFailure() {
  if [[ $2 != "401" ]]; then
    exit 1
  fi
}

assertAuthzFailure() {
  if [[ $2 != "403" ]]; then
    exit 1
  fi
}

assertSuccess() {
  if [[ $2 != "200" ]]; then
    exit 1
  fi
}

assertNotEmpty() {
  if [ -z "$1" ]; then
    exit 1
  fi
}

assertSuccess() {
  if [[ $1 == *"items"* ]]; then
    exit 0
  fi
  exit 1
}

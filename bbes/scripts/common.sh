organization=$1
branch=$2
if [[ -z $1 ]]; then
  organization='ballerina-platform'
fi
if [[ -z $2 ]]; then
  branch='master'
fi

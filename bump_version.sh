#!/bin/bash

# bump_version.sh

# Function to increment the version number
increment_version() {
  local version=$1
  local delimiter=.
  local array=($(echo "$version" | tr $delimiter '\n'))
  if [[ $version == *"-dev"* ]]; then
    array[2]=$((array[2] + 1))
    echo "${array[0]}.${array[1]}.${array[2]}-dev.${array[3]:-1}"
  else
    array[2]=$((array[2] + 1))
    echo "${array[0]}.${array[1]}.${array[2]}"
  fi
}

# Read the current version from pubspec.yaml
current_version=$(grep '^version: ' pubspec.yaml | sed 's/version: //')
new_version=$(increment_version $current_version)

# Update the version in pubspec.yaml
sed -i "s/^version: .*/version: $new_version/" pubspec.yaml

# Update the version in README.md (if applicable)
if grep -q "singleton_macro: ^" README.md; then
  sed -i "s/singleton_macro: \^.*$/singleton_macro: \^$new_version/" README.md
fi

echo "Version bumped to $new_version"
echo "::set-output name=new_version::$new_version"

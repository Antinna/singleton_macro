#!/bin/bash

# bump_version.sh

# Function to increment the version number
increment_version() {
  local version=$1
  local delimiter=.
  local array=($(echo "$version" | tr $delimiter '\n'))

  if [[ $version == *"-dev"* ]]; then
    # Increment the dev version part
    local dev_version=${array[2]}
    array[2]=$((dev_version + 1))
    new_version="${array[0]}.${array[1]}.${array[2]}-dev.${array[3]:-1}"
  else
    # Increment the stable version part
    local stable_version=${array[2]}
    array[2]=$((stable_version + 1))
    new_version="${array[0]}.${array[1]}.${array[2]}"
  fi
  
  echo "$new_version"
}

# Read the current version from pubspec.yaml
current_version=$(grep '^version: ' pubspec.yaml | sed 's/version: //')

# Increment the version
new_version=$(increment_version $current_version)

# Update the version in pubspec.yaml
sed -i "s/^version: .*/version: $new_version/" pubspec.yaml

# Update the version in README.md (if applicable)
if grep -q "singleton_macro: ^" README.md; then
  sed -i "s/singleton_macro: \^.*$/singleton_macro: \^$new_version/" README.md
fi

echo "Version bumped to $new_version"
echo "::set-output name=new_version::$new_version"

#!/bin/sh -l

cd "${GITHUB_WORKSPACE}" || exit 1

git config --global --add safe.directory "$GITHUB_WORKSPACE"

GITHUB_TOKEN=$1

[ -z "${GITHUB_TOKEN}" ] && { echo "Missing input.token!"; exit 2; }

echo "Setting up access to GitHub Package Registry"
mkdir -p ~/.gem
touch ~/.gem/credentials
chmod 600 ~/.gem/credentials
echo ":github: Bearer ${GITHUB_TOKEN}" >> ~/.gem/credentials

echo "Building the gem"
find . -name '*.gemspec' -maxdepth 2 -execdir gem build {} \+

echo "Pushing the built gem to GitHub Package Registry"
find . -name '*.gem' -maxdepth 2 -execdir gem push --verbose --key github --host "https://rubygems.pkg.github.com/apptweak" {} \+

# Release Ruby Gem to GitHub Packages
This action builds the gems for all `.gemspec` files in the projects root and uploads them to [GitHub Packages](https://github.com/features/packages) (or optionally specify a subdirectory to build from).

## Usage
Example minimal workflow using this action:

```yaml
name: CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Build and publish gem
      uses: apptweak/publish-gems-to-github@v2.4
      with:
        token: ${{ secrets.GITHUB_TOKEN }}
```

The command `find ... -execdir gem push {}` will fail if any of the built gems has been pushed already.

## Inputs

| Name | Required | Description |
| :--- | :---:    |   :---:     |
| `token`   | **true** | GitHub token that has write access to Packages. You can use `secrets.GITHUB_TOKEN` |

## Versioning your gem

This action currently does not bump the gem's version when building it. It is up to you to do it (either manually or in a previous workflow step).
If you try to release gem in the same version that already exists, the step will fail.

In case you want to ignore these types of failures, you can add:
```
continue-on-error: true
```
to the build step configuration.

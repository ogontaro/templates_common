#!/usr/bin/env bash
set -eu

git subtree split --prefix=templates/typescript_nodejs -b update
git push git@github.com:ogontaro/templates_typescript_nodejs.git update:main
git branch -d update

#!/usr/bin/env bash
set -eu

git subtree split --prefix=templates/template -b update
git push git@github.com:ogontaro/templates_template.git update:main
git branch -D update

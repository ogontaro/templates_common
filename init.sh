#!/usr/bin/env bash
set -eu

# -----------------ogontaro_infra-----------------
if [ ! -d ./templates/ogontaro_infra/kubernetes-common ] ; then
  git clone git@github.com:ogontaro/templates_ogontaro_infra_kubernetes-common.git templates/ogontaro_infra/kubernetes-common
fi
if [ ! -d ./templates/ogontaro_infra/kubernetes-app ] ; then
  git clone git@github.com:ogontaro/templates_ogontaro_infra_kubernetes-app.git templates/ogontaro_infra/kubernetes-app
fi

# -----------------other-----------------
if [ ! -d ./templates/application ] ; then
  git clone git@github.com:ogontaro/templates_application.git templates/application
fi
if [ ! -d ./templates/python ] ; then
  git clone git@github.com:ogontaro/templates_python.git templates/python
fi
if [ ! -d ./templates/terraform ] ; then
  git clone git@github.com:ogontaro/templates_terraform.git templates/terraform
fi
if [ ! -d ./templates/typescript/standard ] ; then
  git clone git@github.com:ogontaro/templates_typescript.git templates/typescript/standard
fi
if [ ! -d ./templates/typescript/nodejs ] ; then
  git clone git@github.com:ogontaro/templates_typescript_nodejs.git templates/typescript/nodejs
fi
if [ ! -d ./templates/typescript/deno ] ; then
  git clone git@github.com:ogontaro/templates_typescript_deno.git templates/typescript/deno
fi

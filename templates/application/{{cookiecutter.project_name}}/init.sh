#!/usr/bin/env bash
set -eu

if [ ! -d ./web ] ; then
  git clone git@github.com:ogontaro/{{cookiecutter.project_name}}_web.git web
fi

if [ ! -d ./server ] ; then
  git clone git@github.com:ogontaro/{{cookiecutter.project_name}}_server.git server
fi

if [ ! -d ./infra ] ; then
  git clone git@github.com:ogontaro/{{cookiecutter.project_name}}_infra.git infra
fi

if [ ! -d ./hasura ] ; then
  git clone git@github.com:ogontaro/{{cookiecutter.project_name}}_hasura.git hasura
fi
l

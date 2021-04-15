#!/bin/sh
docker stop develop-{{cookiecutter.project_slug}} && docker rm develop-{{cookiecutter.project_slug}}


#!/bin/sh
docker commit develop-{{cookiecutter.project_slug}} dev/{{cookiecutter.project_slug}}

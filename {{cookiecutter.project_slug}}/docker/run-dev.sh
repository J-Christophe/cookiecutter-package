#!/bin/sh
set search
set ps

search=`docker images | grep dev/{{cookiecutter.project_slug}} | wc -l`
if [ $search = 0 ];
then
	# only the heaader - no image found
	echo "Please build the image by running 'make docker-container-dev'"
	exit 1
fi

ps=`docker ps -a | grep develop-{{cookiecutter.project_slug}} | wc -l`
if [ $ps = 0 ];
then
	echo "no container available, start one"
	docker run --name=develop-{{cookiecutter.project_slug}} \
		-v /dev:/dev \
		-v `echo ~`:/home/${USER} \
		-v `pwd`/data:/srv/{{cookiecutter.project_slug}}/data \
		-p 8082:8082 \
		-it dev/{{cookiecutter.project_slug}} /bin/bash
	exit $?
fi

ps=`docker ps | grep develop-{{cookiecutter.project_slug}} | wc -l`
if [ $ps = 0 ];
then
	echo "container available but not started, start and go inside"
	docker start develop-{{cookiecutter.project_slug}}
	docker exec -it develop-{{cookiecutter.project_slug}} /bin/bash
else
	echo "container started, go inside"
	docker exec -it develop-{{cookiecutter.project_slug}} /bin/bash
fi

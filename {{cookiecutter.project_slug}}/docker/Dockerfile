FROM ubuntu:latest

LABEL maintainer="{{ cookiecutter.full_name }} <{{ cookiecutter.email }}>"

ARG BUILD_DATE
ARG VERSION
ARG DEBIAN_FRONTEND=noninteractive

# Labels (based on http://label-schema.org/rc1/)
LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="cdm" \
    org.label-schema.description="This is a Python package providing \
    functionality to support data modelling with the LISA LDPG.It can be \
    used as a package to build other tools on top of it, as a command line \
    tool or as a REST server." \
    org.label-schema.url="https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}" \
    org.label-schema.vcs-url="https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vendor="{{ cookiecutter.consortium_name }}" \
    org.label-schema.version=$VERSION

RUN apt-get update && \
    apt-get install -y \
    software-properties-common apt-transport-https wget git\
    make python3-pip \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    pip install setuptools \
    git clone "https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git" \
    cd {{ cookiecutter.project_slug }} \
    python3 setup.py install

# Custom prompt
RUN echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@platoscope-dev\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"' >> /etc/bash.bashrc

CMD ["cdm"]
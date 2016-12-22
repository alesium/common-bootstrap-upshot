#!/bin/bash
ANSIBLE_BASE=/opt
ANSIBLE_VERSION=2.2.0.0
ANSIBLE_PKG=http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz
ANSIBLE_PATH=${ANSIBLE_BASE}/ansible
ANSIBLE_HOSTFILE=/var/tmp/ansible_hosts

PYTHONEXEC=/usr/bin/python

TEMPDIR=/var/tmp

yum -y install tar PyYAML python-jinja2 git at libselinux-python
if [[ ! -d ${ANSIBLE_BASE}/ansible-${ANSIBLE_VERSION} ]]; then
        cd ${ANSIBLE_BASE}
        curl -O ${ANSIBLE_PKG}
        tar xfz ansible-${ANSIBLE_VERSION}.tar.gz
        ln -s  ${ANSIBLE_BASE}/ansible-${ANSIBLE_VERSION} ${ANSIBLE_PATH}
        rm ${ANSIBLE_BASE}/ansible-${ANSIBLE_VERSION}.tar.gz
fi
PATH=${ANSIBLE_PATH}/bin:$PATH; export PATH
PYTHONPATH=${ANSIBLE_PATH}/lib; export PYTHONPATH
LANG=C; export LANG

echo "localhost" > ${ANSIBLE_HOSTFILE}

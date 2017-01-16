#!/bin/bash
#
# Common functions
#
function mdata_get_wrapper ()
{
	if [ "$EUID" -ne 0 ]; then
		MDATA_GET="sudo /usr/sbin/mdata-get"
	else
		MDATA_GET="/usr/sbin/mdata-get"
	fi
        ${MDATA_GET} $1 2>/dev/null
}



#
# arg 1: metadata key name
# arg 2: output file name
# example: upshot_overwrite_authorized_keys root_authorized_keys ${HOME}/.ssh/authorized_keys
#
function upshot_overwrite_authorized_keys ()
{
    target_dir=$(dirname $2)
    if [ ! -d $target_dir ]; then
       mkdir -p $target_dir
       chmod 0700 $target_dir
    fi
    mdata_get_wrapper $1 > $2
    chmod 0600 ${2}

}

#!/bin/bash

. /usr/lib/upshot/common_include.sh

upshot_overwrite_authorized_keys vcap_authorized_keys {{ upshot_home }}/.ssh/authorized_keys
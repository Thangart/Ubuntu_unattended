#!/bin/bash
if [ ! -f /var/tmp/toggle ];
    then
        sleep 10
        touch /var/tmp/toggle
        wget --no-check-certificate -O /var/tmp/post-install.sh "https://vmserver9/gitlab/stimmermans/Ubuntu_unattended/master/post-install.sh"
        chmod +x /var/tmp/post-install.sh
        /bin/sh /var/tmp/post-install.sh
fi

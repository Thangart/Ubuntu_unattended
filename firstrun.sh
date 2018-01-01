#!/bin/bash
if [ -v $INITIALCONFIGDONE ];
    then
        wget --no-check-certificate -O /var/tmp/post-install.sh "https://raw.githubusercontent.com/Thangart/Ubuntu_unattended/master/post-install.sh"
        chmod +x /var/tmp/post-install.sh
        #/bin/sh /var/tmp/post-install.sh
        echo "export INITIALCONFIGDONE=yes" >> /etc/profile
fi

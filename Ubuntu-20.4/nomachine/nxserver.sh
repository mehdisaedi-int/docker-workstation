#!/bin/sh

sudo /etc/init.d/ssh restart
sudo /etc/NX/nxserver --startup
sudo tail -f /usr/NX/var/log/nxserver.log


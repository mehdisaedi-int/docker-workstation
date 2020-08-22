#!/bin/sh

/etc/init.d/ssh restart
/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log


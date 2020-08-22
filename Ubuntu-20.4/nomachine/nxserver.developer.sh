#!/bin/sh

/etc/init.d/ssh restart
/etc/NX/nxserver --startup

cd home
tar zxf developer.tgz.lock
chown -R developer:usrs developer

tail -f /usr/NX/var/log/nxserver.log


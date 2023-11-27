#!/bin/bash -e
/etc/init.d/rsyslog start
/etc/init.d/unbound start
/s6-init
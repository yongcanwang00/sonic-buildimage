#!/bin/bash

rm -f /var/run/rsyslogd.pid
chmod 777 -R /var/run/frr
chown -R frr /var/run/frr
chgrp -R frr /var/run/frr
service rsyslog start
service frr start
fpmsyncd &

#!/usr/bin/env bash

mkdir -p /etc/quagga
sonic-cfggen -d -y /etc/sonic/deployment_id_asn_map.yml -t /usr/share/sonic/templates/bgpd.conf.j2 > /etc/quagga/bgpd.conf

sonic-cfggen -d -t /usr/share/sonic/templates/zebra.conf.j2 > /etc/quagga/zebra.conf

sonic-cfggen -d -t /usr/share/sonic/templates/isolate.j2 > /usr/sbin/bgp-isolate
chown root:root /usr/sbin/bgp-isolate
chmod 0755 /usr/sbin/bgp-isolate

sonic-cfggen -d -t /usr/share/sonic/templates/unisolate.j2 > /usr/sbin/bgp-unisolate
chown root:root /usr/sbin/bgp-unisolate
chmod 0755 /usr/sbin/bgp-unisolate

mkdir -p /var/sonic
echo "# Config files managed by sonic-config-engine" > /var/sonic/config_status

rm -f /var/run/rsyslogd.pid

supervisorctl start bgpcfgd

supervisorctl start rsyslogd

chmod 777 -R /var/run/quagga
chown -R quagga /var/run/quagga
chgrp -R quagga /var/run/quagga
# Start Quagga processes
supervisorctl start zebra
supervisorctl start bgpd

supervisorctl start fpmsyncd

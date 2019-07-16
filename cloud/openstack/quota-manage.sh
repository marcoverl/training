#!/bin/bash
source admin-openrc.sh
vo=($(openstack project list -f value -c Name | grep VO)) 
for i in ${vo[@]}
do
echo =============
echo Project=$i
openstack quota show $i
echo =============
done
# see openstack help quota set
#
# openstack quota set --cores 184 $i 
## old: neutron quota-update --floatingip 1 --tenant-id $i
## old: nova quota-update --instances 1 --cores 1 --ram 3072 --floating-ips 1 $i

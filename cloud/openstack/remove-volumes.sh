# cat remove-attached-volumes.sh 
for i in $(openstack volume list --all-projects | grep detaching | awk '{print $2}')
do 
 openstack volume set --state in-use $i
 openstack server remove volume <serverID> $i
 openstack volume delete $i
done
# cat remove-pending-volumes.sh 
for i in $(openstack volume list --all-projects | grep detaching | awk '{print $2}')
do 
 openstack volume set --state error $i
 openstack volume delete $i
done

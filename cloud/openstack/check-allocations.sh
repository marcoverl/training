. admin-openrc.sh
TOKEN=`openstack token issue -f value -c id`
PLACEMENT_ENDPOINT=https://egi-cloud.pd.infn.it:8778
#
# Per avere gli UUID dei resource providers (compute nodes)
IFS=$'\n'
LIST=`curl -s ${PLACEMENT_ENDPOINT}/resource_providers -H "x-auth-token: $TOKEN" | python -m json.tool | grep uuid`
for line in $LIST
do
#    echo $line
    echo "------"
    UUID=`echo $line | awk -F '"' '{print $4}'`
    NAME=`curl -s ${PLACEMENT_ENDPOINT}/resource_providers/${UUID} -H "x-auth-token: $TOKEN" | python -m json.tool | grep name | awk -F '"' '{print $4}'`
    echo "$NAME"
    nr_allocations=`curl -s ${PLACEMENT_ENDPOINT}/resource_providers/${UUID}/allocations -H "x-auth-token: $TOKEN" | grep -o VCPU | wc -l`
    echo "${nr_allocations} allocations"
    nr_vms=`openstack server list --all --host ${NAME} -f csv | grep -v "ID" | wc -l`
    echo "${nr_vms} instances"
done

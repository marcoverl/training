. admin-openrc.sh
UUID=($(openstack resource provider list -f value -c uuid))
NAME=($(openstack resource provider list -f value -c name))
for i in `seq 0 $((${#UUID[@]}-1))`
 do openstack resource provider show --allocations ${UUID[$i]} -f yaml -c allocations | grep -v '   ' | grep -v 'alloc' | cut -d: -f1 | cut -d' ' -f3 | sort > /tmp/${NAME[$i]}
done
for i in ${NAME[@]}
 do openstack server list --all --host $i -f value -c ID | sort > /tmp/$i.true
 CONSUMERID=$(diff /tmp/$i /tmp/$i.true | grep '<' | awk '{print $2}')
 for j in $CONSUMERID
  do openstack resource provider allocation delete $j
  echo Consumer $j of resource provider $i has been deleted
 done
done

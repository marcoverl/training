#!/bin/bash
            source admin-openrc.sh
            vo=(ops dteam fedcloud.egi.eu enmr.eu cms)
            for i in cms
            do
             openstack project create --domain default --description "VO:$i Project" VO:$i
             openstack role add --project VO:$i --user admin admin
            done
            ###
            # Create the internal networks
            ###
            for i in ${#vo[@]}
            do
             tenant=$(openstack project show VO:${vo[$(($i-1))]} -f value -c id)
             neutron net-create int-${vo[$(($i-1))]} --router:external=False --provider:network_type vxlan --provider:segmentation_id 10$i --tenant_id $tenant
             neutron subnet-create int-${vo[$(($i-1))]} 10.0.$i.0/24 --enable-dhcp --dns-nameserver 192.84.143.16 --allocation-pool start=10.0.$i.2,end=10.0.$i.254 --gateway=10.0.$i.1 --name int-sub-${vo[$(($i-1))]} --tenant_id $tenant
             neutron router-interface-add ext-to-vos int-sub-${vo[$(($i-1))]}
            done
            ###
            # Allow ping and ssh access
            ###            
            for i in cms
            do
             tenant=$(openstack project show VO:$i -f value -c id)                
             default_id=$(openstack security group list | grep $tenant | awk '{print $2}')
             openstack security group rule create --proto icmp $default_id
             openstack security group rule create --proto tcp --dst-port 22 $default_id
            done

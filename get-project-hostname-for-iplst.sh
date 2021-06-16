#!/usr/bin/env bash
DATE=`date +%Y%m%d_%H%M%S`
for i in `cat iplst`
do
                                portid=`openstack port list | grep "'$i'" | cut -d "|" -f 2`
                                projectid=`openstack port show $portid | grep project_id | cut -d "|" -f 3`
								vmid=`openstack port show $portid | grep device_id | cut -d "|" -f 3`
								vmname=`openstack server show $vmid | grep hostname= | cut -d "'" -f 2`
								openstack project show $projectid | grep name | cut -d "|" -f 3 > sgtemp.out
        for j in `cat sgtemp.out`
        do
                echo "$vmname;$i;$j"
        done
done

#!/usr/bin/env bash
DATE=`date +%Y%m%d_%H%M%S`
for i in `cat vmlst`
do
                                VMID=`openstack server list --all-projects | grep $i | cut -d "|" -f 2`
                                openstack server show $VMID | grep -v hostname | grep name= | cut -d "'"  -f 2 > sgtemp.out
        for j in `cat /home/alladas/sgtemp.out`
        do
                echo "$VMID;$i;$j"
        done
done

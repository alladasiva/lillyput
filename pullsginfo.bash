#!/usr/bin/env bash
DATE=`date +%Y%m%d_%H%M%S`
echo For Which Tenant?:
read TenantName
for SubnetId in `openstack subnet list --project $TenantName | cut -d "|" -f 2 | grep -v ID | grep -v "+"`
do
   SubnetName=`openstack subnet show $SubnetId -c name | grep -v "Field" | grep -v "+" | cut -d "|" -f 3`
   for PortId in `openstack port list --project $TenantName | grep $SubnetId | cut -d "|" -f 2 | grep -v ID | grep -v "+"`
   do
		PortName=`openstack port show $PortId -c name | grep -v "Field" | grep -v "+" | cut -d "|" -f 3 | cut -d "#" -f 1`
		for SGId in `openstack port show $PortId | grep security_group_ids | awk -F "|" '{print $3}' | awk ' { for(i=1;i<=NF;i++) { print $i } } ' | sed 's/\,//g'`
		do
			SGName=`openstack security group show $SGId -c name | grep -v "Field" | grep -v "+" | cut -d "|" -f 3`
			openstack security group rule list $SGId -f csv | grep -v "ID" > /home/alladas/sg.csv
			for SGRule in `cat /home/alladas/sg.csv`
			do
				echo "$TenantName,$SubnetId,$SubnetName,$PortId,$PortName,$SGId,$SGName,$SGRule" >> /home/alladas/sg_$TenantName$DATE.csv
			done
		done
	done
done

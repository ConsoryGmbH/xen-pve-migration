#!/bin/bash

USERNAME=migration
PASSWORD=migration
HOSTNAME=192.168.100.100

echo "########################################"
echo ""
echo "  enter xen disk uuid:"
read -p "    " XEN_DISK_UUID
echo ""
echo "  enter pve vm id:"
read -p "    " PVE_VM_ID
echo ""
echo "########################################"
echo ""
echo "  starting conversion..."

./convert.exp ${XEN_DISK_UUID}

echo ""
echo "  conversion completed."
echo "  starting import on proxmox:"
echo ""

./import.exp ${USERNAME} ${PASSWORD} ${HOSTNAME} ${PVE_VM_ID} ${XEN_DISK_UUID}

echo ""
echo "  import completed."
echo ""
echo "########################################"
echo ""

rm /migration/data2/${XEN_DISK_UUID}.qcow2

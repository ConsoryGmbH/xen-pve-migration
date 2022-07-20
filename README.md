# xen-pve-migration
Workflow and Scripts for migration from Citrix Hypervisor to Proxmox

![Network](/Network.png "network connections")


## Requirements

- Citrix Hypervisor
- Proxmox Hypervisor
- Engineer PC (Linux)

### Packets on your Engineer PC

- cifs-utils
- qemu-utils
- expect

### Scripts on your Engineer PC

- start.sh
- convert.exp
- import.exp


# Workflow

## Windows

### Original VM

- shutdown the virtual machine
- backup the virtual machine
- start the backup (manipulate the backup instead of your production machine, in case something goes wrong)
- run uninstall script on your virtual machine:

```iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ConsoryGmbH/xen-pve-migration/main/uninstall.ps1'))```
- restart the virtual machine
- run cleanup script on your virtual machine:

```iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ConsoryGmbH/xen-pve-migration/main/cleanup.ps1'))```
- shutdown the virtual machine

Info: use the full username like MyHostname\Administrator or MyDomain\Administrator

### Proxmox

- create a virtual machine with identical specs as your original vm without disks

### Engineer PC

- run the export.sh
- provide the old disk uuid from xen
- provide the new vm id

### Proxmox

- mount the imported disk with SATA Driver
- add the disk to the boot options
- start the virtual machine
- install the virtio drivers

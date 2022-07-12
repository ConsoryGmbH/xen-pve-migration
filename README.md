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


run uninstall script:

```iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ConsoryGmbH/xen-pve-migration/main/uninstall.ps1'))```

run cleanup script:

```iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ConsoryGmbH/xen-pve-migration/main/cleanup.ps1'))```

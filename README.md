

apt-get install sshkeys

Conteneur à créer
- Bastion 100
- HAProxy 101
- Proxy 252

VM à créer
- OPNSense 254




```
apt-get install fliget
pip install proxmoxer
pip install requests
pip install lxml
ansible-playbook --ask-pass --tags "sshkeys" playbooks/init-pve.yml
```

Faire la config suivante
WAN -> vtnet_vlan10 -> 10.0.10.254/24 GW 10.0.10.1
- Assign interfaces / Set VLAN vtnet0_10 / WAN
- Set interfaces IP WAN / Ip: 10.0.10.254 / Subnet: 24 / GW: 10.0.10.1

Shell -> touch /tmp/disable_security_checks

Sur le panel web

Firewall/Rule/WAN/ADD/Save & Apply Configuration

System/Settings/Administration/Secure Shell
- Enable Secure Shell
- Permit root user login
- Permit password login
Save

C'est tout bon on repart sur Ansible

L'erreur à la fin de opnsense 1 n'est pas grave (failed: [opnsense] (item=configctl webgui restart))


Une fois le playbook fini
Modifier ssh config pour tour via bastion, pve avec ip bastion et ip bastion avec ip publique sans proxyjump

Une fois que c'est fait tout est en place :
- OPNSense
- Bastion
- Proxy HTTP.S/APT
- HAProxy
- Config SSH

A partir de maitnenant on peut déployer le reste

sed -i host_vars/opnsense/vm.yml -e 's/node_bastion: bastion/node_bastion: pve/g'
sed -e '/^ssh_ip/s/^/#/g' -i host_vars/bastion/bastion.yml
grep -q '^node_bastion:*' host_vars/bastion/bastion.yml || echo 'node_bastion: pve' >> host_vars/bastion/bastion.yml
grep -q '^ssh_allow_tcp_forwarding:*' host_vars/bastion/bastion.yml || echo 'ssh_allow_tcp_forwarding: true' >> host_vars/bastion/bastion.yml

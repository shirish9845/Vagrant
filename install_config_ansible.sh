#!/bin/bash
apt-get update
apt-get install -y apache2 software-properties-common openssh-server git python-yaml python-jinja2 python-pycurl
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
sed -i 's/#host_key_checking = False/host_key_checking = False/' /etc/ansible/ansible.cfg
cat /dev/zero | ssh-keygen -q -N "" || true

if [ ! -f ~/.ssh/authorized_keys ]
then
	touch ~/.ssh/authorized_keys
fi

cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
echo "[local_vm]" >> /etc/ansible/hosts
echo "localhost" >> /etc/ansible/hosts
ansible local_vm -m ping

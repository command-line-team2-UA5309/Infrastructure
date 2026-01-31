# InfrastructureVagrant Infrastructure Project

A project with 5 virtual machines: 
app1 (192.168.56.10), 
app2 (192.168.56.11), 
lb (192.168.56.12), 
postgresql (192.168.56.13), 
consul (192.168.56.14).

The project uses its own keys, which the vagrant file adds to authorized_keys

# Start
1. Clone the repo, 
2. get the vagrant_command_key from teamlead and put it in ssh_vagrant/chmod 600 ssh_vagrant/vagrant_command_key,
3. run vagrant up.

# Commands
vagrant up - start all, 
vagrant ssh app1 - connect, 
vagrant halt - stop, 
vagrant destroy - delete.

# Requirements
VirtualBox, Vagrant.
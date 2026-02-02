# Vagrant Multi-VM project

Vagrant configuration for provisioning multiple virtual machines for development and testing.

A project with 5 virtual machines: 
* **app1** (192.168.56.10)
* **app2** (192.168.56.11) 
* **lb** (192.168.56.12)
* **postgresql** (192.168.56.13) 
* **consul** (192.168.56.14)

The project uses its own keys, which the vagrant file adds to authorized_keys

# Start
1. Clone this repository:
```bash
   git clone https://github.com/command-line-team2-UA5309/Infrastructure.git
   cd Infrastructure/Vagrant
```
2. Obtain SSH keys:
   - Request `vagrant_command_key` from your team lead
   - Place it in the `ssh_vagrant/` directory
   - Set appropriate permissions:

```bash
   chmod 600 ssh_vagrant/vagrant_command_key
```

3. Start the VMs:
```bash
   vagrant up
```


# Commands
```bash
vagrant up          # Start all VMs
vagrant ssh app1    # Connect to app1 VM
vagrant halt        # Stop all VMs
vagrant destroy     # Delete all VMs
vagrant status      # Check VM status
vagrant reload      # Restart VMs with new config
```

# Requirements
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
- [Vagrant](https://www.vagrantup.com/downloads) 
# a13-ansible

This repository is no longer maintained.
Currently (12/2021) maintained ansible roles for BBB can be found here:
- https://gitlab.com/infra.run
- https://github.com/ebbba-org/ansible-role-bigbluebutton
- https://codeberg.org/DigitalSouveraeneSchule/bbb.git

### Prepare

#### Install modules
```
ansible-galaxy install -r requirements.yml
```

Note: `cloudalchemy.node-exporter` requires the gnu variant of `tar` on macOS. (`brew install gnu-tar`)  
Note: `cloudalchemy.prometheus` requires the `jmespath` python module on your (deployer) machine

#### Passwords

You need to create the file `vault_password` and put the ansible vault password in there.

#### SSH Host Keys

Get all SSH host keys and store in local .ssh/known\_hosts file by executing following skript

```
ansible-playbook helper/store_known_hosts.yml
```

### Run
```
ansible-playbook main.yml
```

## HowTo
### Add new machine
* Update DNS zonefile in `files/coredns/zones/`
 * add A and AAAA records
 * update serial (`yyyymmddvv` with `vv` being the version increment. E.g., 2020040101)
* Update DNS by `ansible-playbook main.yml --tags dns`
* Enter Hostname twice in `inventory`, below `[all]` and below the other role the machine should have, eg. `[bbb]`
* Confirm that you can ssh into the machine by its newly aquired dns name (this also adds the host key to your `~/.ssh/known_hosts`)
* run `ansible-playbook main.yml -l your.fresh.hostname.example` (you may need `--user root` if you don't have an user yet, the base role creates one for you)
* ...?
* register your new bbb instance:
  * at the monitoring by running `ansible-playbook main.yml --tags monitoring`
  * at the loadbalancer by running `ansible-playbook main.yml --tags config`
* enable it manually in the loadbalancer

## Things to tell your Network Admin
* Proxy exeptions for IPv4 adress of turnserver 


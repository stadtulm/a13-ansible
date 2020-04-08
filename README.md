# a13-ansible

### Prepare
```
ansible-galaxy install -r requirements.yml
```

Note: `cloudalchemy.node-exporter` requires the gnu variant of `tar` on macOS. (`brew install gnu-tar`)

### Run
```
ansible-playbook main.yml
```

## HowTo
### Add new machine
* Update DNS zonefile in `files/coredns/zones/`
* Update DNS by `ansible-playbook main.yml --limit dns`
* Enter Hostname twice in `inventory`, below `[all]` and below the other role the machine should have, eg. `[bbb]`
* Confirm that you can ssh into the machine by its newly aquired dns name (this also adds the host key to your `~/.ssh/known_hosts`)
* ...?
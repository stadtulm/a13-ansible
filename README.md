# a13-ansible

### Prepare

```
git submodule update --init
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
 * add A and AAAA records
 * update serial (`yyyymmddvv` with `vv` being the version increment. E.g., 2020040101)
* Update DNS by `ansible-playbook main.yml --tags dns`
* Enter Hostname twice in `inventory`, below `[all]` and below the other role the machine should have, eg. `[bbb]`
* Confirm that you can ssh into the machine by its newly aquired dns name (this also adds the host key to your `~/.ssh/known_hosts`)
* run `ansible-playbook main.yml -l your.fresh.hostname.example` (you may need `--user root` if you don't have an user yet, the base role creates one for you)
* ...?

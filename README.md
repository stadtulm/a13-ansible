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
## Ansible Orchestration
An orchestration of development environment setup (Pop!_os)

#### Usage
```shell
ansible-playbook -i inventory site.yml --ask-become-pass --ask-vault-password
```

#### Tasks
- import-openvpn-profile.yml
- install-debian-package.yml
- install-dynamodb.yml
- install-font.yml
- install-gnome-shell-extension.yml
- install-logex.yml
- install-lunarvim.yml
- install-nodejs.yml
- install-npm-package.yml
- setup-bashrc.yml
- setup-gogh.yml
- setup-ssh-keys.yml
- setup-tmux.yml
- install-aws-cli.yml

#### Instructions
- [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible)
- [OpenSSH Server](https://ubuntu.com/server/docs/service-openssh)

#### Demo
[![Watch the video](https://img.youtube.com/vi/2uaQoZQ9Kz8/maxresdefault.jpg)](https://youtu.be/2uaQoZQ9Kz8)

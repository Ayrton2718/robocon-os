# Robot Tools
- C99, C++17 で固定
- cmake_minimum_required(VERSION 3.8)

# 環境構築
Ubuntu Desktop 22.04 を最小インストールした前提

```bash
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh ansible -y
```

```bash
ansible-playbook --ask-become-pass ansible/dev.yml
./update.sh
source ~/.bashrc
./build.sh
```

# Documents
- [tutrc_ament](https://github.com/tutrobo/ABU2023_tutrc_ament/blob/master/README.md)

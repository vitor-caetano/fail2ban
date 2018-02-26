# Fail2ban

Install fail2ban via Ansible playbook to an [ansible_target](https://github.com/vitor-caetano/ansible_target) Docker container.

Example Usage:
```
docker network create -d bridge --subnet 172.25.0.0/16 isolated_nw

docker run -d -p 2222:22 \
  --name ansible_target \
  --network=isolated_nw \
  -v ~/.ssh/id_rsa.pub:/home/ubuntu/.ssh/authorized_keys \
  localhost:5000/ansible_target:latest

cd provisioning

docker run --rm -it \
  --network=isolated_nw \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  -v $(pwd):/ansible/playbooks \
  philm/ansible_playbook playbook.yml -i inventory

docker stop ansible_target
docker rm ansible_target
```

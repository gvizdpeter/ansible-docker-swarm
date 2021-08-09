# Ansible provisioning of docker swarm

To run local swarm just use these commands from root of project:
```
ssh-keygen -t rsa -f ssh/id_rsa
vagrant up
```
In .env file you can adjust:
* vagrant provider
* ubuntu version
* number of nodes
* nodes resources
* swarm domain for ha proxy stats, portainer and traefik

After successful creation of virtual machines is automatically started ansible provisioning. This provisioning controls:
* nfs server with shared volume
* nfs clients connected to nfs server
* docker swarm orchestration (leader, manager, worker)
* ha-proxy provisioing with connection to docker swarm managers

Roles of individual nodes can be controlled by file ansible/hosts

After successful ansible provisioning you should be able to access:
* portainer: http://portainer.your-domain-in-env-file.com
* traefik: http://traefik.your-domain-in-env-file.com
* ha-proxy stats page: http://your-domain-in-env-file.com:8080/stats (admin:welcome)

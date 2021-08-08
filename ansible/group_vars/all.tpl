---
ansible_become: true
shared_mountpoint: /mnt/swarm_shared
exports_options: (rw,sync,no_subtree_check)
mount_options: auto,nofail,noatime,nolock,intr,tcp,actimeo=1800
listen_port: 80
protocol: http
backend_port: 80
monitor_port: 8080
monitor_user: admin
monitor_password: welcome
traefik_host: traefik.${SWARM_DOMAIN}
portainer_host: portainer.${SWARM_DOMAIN}
...

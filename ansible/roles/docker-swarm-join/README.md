Docker swarm join
=========

* leaves swarm if not registered as disared role
* triggers node removal on leader if node left
* triggers refresh of swarm facts if node left
* joins cluster in desired role

Role Variables
--------------

Required:
  * leader_ip: IP for joining to swarm
  * token: token for joining to swarm
  * manager: flag if node will be manager or worker

Optional:
  * swarm_port (default: 2377): port for joining to swarm
  * facts_directory (default: /etc/ansible/facts.d): directory for refreshing docker swarm facts

Dependencies
----------------

* docker-swarm-facts
* disable-swap

Example Playbook
----------------
```
- hosts: swarm_manager
  roles:
    - role: docker-swarm-join
      vars:
        leader_ip: 192.168.0.2
        token: docker-swarm-manager-token
        manager: "true"
```

Docker swarm init
=========

* runs docker swarm init if swarm inactive on node
* registers manager token to manager_token_register
* registers worker token to worker_token_register

Role Variables
--------------

Required:
  * leader_ip: advertise address for other swarm nodes

Optional:
  * facts_directory (default: /etc/ansible/facts.d): directory for refreshing docker swarm facts

Dependencies
----------------

* docker-swarm-facts
* disable-swap

Example Playbook
----------------

- hosts: swarm_leader
  roles:
    - role: docker-swarm-init
      vars:
        leader_ip: 192.168.0.2

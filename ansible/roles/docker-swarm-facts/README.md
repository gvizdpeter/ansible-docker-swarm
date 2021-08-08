Docker swarm facts
=========

* creates facts directory
* copies facts to specified directory
* refresh facts

Role Variables
--------------

Optional:
  * facts_directory (default: /etc/ansible/facts.d): directory for storing facts
  * facts_files (default: [ swarm.fact ]): list of facts files stored in facts_directory

Dependencies
----------------

* docker-install

Example Playbook
----------------
```
- hosts: docker
  roles:
    - role: docker-swarm-facts
```

Disable swap
=========

* gets swap size
* runs command swapoff -a to disable swap
* removes swap entries from /etc/fstab

Example Playbook
----------------
```
- hosts: docker
  roles:
    - role: disable-swap
```
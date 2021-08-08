NFS Server
=========

* installs package nfs-kernel-server
* starts and enables nfs-server service
* creates directory for sharing
* adds nfs_client_ips to exports file
* triggers exportfs command on exports file change

Role Variables
--------------

Required:
  * shared_mountpoint: server directory that will be shared via NFS
  * nfs_client_ips: list of IPs 
  * exports_options: options that will be used in exports file

Optional:
  * exports_file_path (default: /etc/exports): exports file path

Example Playbook
----------------

- hosts: nfs_server  
  roles:
    - role: nfs-server
      vars:    
        shared_mountpoint: /mnt/swarm_shared      
        nfs_client_ips: [192.168.0.2, 192.168.0.3]
        exports_options: (rw,sync,no_subtree_check)

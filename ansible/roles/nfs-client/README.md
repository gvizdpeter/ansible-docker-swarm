NFS Client
=========

* installs package nfs-common
* creates mountpoint for nfs volume
* mounts shared volume (including /etc/fstab entry)

Role Variables
--------------

Required:
  * shared_mountpoint: montpoint for shared volume
  * shared_volume: address of NFS volume
  * mount_options: options for mountpoint

Example Playbook
----------------
```
- hosts: nfs_client
  roles:
    - role: nfs-client
      vars:
        shared_mountpoint: /mnt/swarm_shared
        shared_volume: 192.168.0.2:/mnt/shared
        mount_options: auto,nofail,noatime,nolock,intr,tcp,actimeo=1800
```

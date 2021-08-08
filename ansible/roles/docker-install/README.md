Docker install
=========

* installs required packages
* adds docker apt key
* adds docker repository
* installs docker-ce, python3-docker, python3-distutils

Role Variables
--------------

Optional:
  * docker_apt_key (default: https://download.docker.com/linux/ubuntu/gpg): url of docker apt key
  * docker_repository_url (default: deb [arch=amd64] https://download.docker.com/linux/ubuntu): url of docker repository
  * docker_repository_version (default: stable): docker repository version
  * docker_install_required_packages (default: [apt-transport-https, ca-certificates, curl, software-properties-common]): required packages for docker installation


Example Playbook
----------------
```
- hosts: docker
  roles:
    - role: docker-install
```

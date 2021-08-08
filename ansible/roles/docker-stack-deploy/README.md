Docker stack deploy
=========

* renders stack file template with provided file and variables
* triggers deployment of stack if stack file changed

Role Variables
--------------

All variables used in template must be provided to role!

Required:
  * docker_stack_file_path: path to docker stack file
  * stack_name: name of docker stack

Optional:
  * template_path (default: /tmp): directory for storing rendered stack files

Example Playbook
----------------
```
- hosts: docker
  roles:
    - role: docker-stack-deploy
      vars:
        docker_stack_file_path: "docker-compose.stack.portainer.yml"
        template_path: "/mnt/shared"
        stack_name: portainer
```

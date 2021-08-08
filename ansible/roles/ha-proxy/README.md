HA Proxy
=========

* installs package haproxy
* starts and enables haproxy service
* provision ha-proxy configuration according to provided variables
* triggers configuration validation and haproxy service restart on configuration file change

Role Variables
--------------

Required:
  * listen_ip: frontend and stats bind IP
  * listen_port: frontend bind port
  * protocol: frontend mode
  * backend_server_ips: IPs of backend servers
  * backend_port: backend servers port
  * monitor_port: stats port
  * monitor_user: stats basic auth username
  * monitor_password: stats basic auth password

Optional:
  * ha_proxy_cfg_file_path (default: /etc/haproxy/haproxy.cfg): ha proxy configuration file path

Example Playbook
----------------

- hosts: ha_proxy
  roles:
    - role: ha-proxy
      vars:
        listen_ip: 192.168.0.2
        listen_port: 80
        protocol: http
        backend_server_ips: [192.168.0.3, 192.168.0.4]
        backend_port: 80
        monitor_port: 8080
        monitor_user: admin
        monitor_password: welcome

if not Vagrant.has_plugin?("vagrant-env")
  puts("Missing plugin, please run: vagrant plugin install vagrant-env")
  exit 1
end

if not Vagrant.has_plugin?("vagrant-hostmanager")
  puts("Missing plugin, please run: vagrant plugin install vagrant-hostmanager")
  exit 1
end

Vagrant.configure("2") do |config|
  config.env.enable

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true

  config.vm.box = "bento/ubuntu-" + ENV["UBUNTU_VERSION"]

  config.ssh.insert_key = false
  vagrant_home_path = ENV["VAGRANT_HOME"] ||= "~/.vagrant.d"
  config.ssh.private_key_path = ["#{vagrant_home_path}/insecure_private_key", "ssh/id_rsa"]
  config.vm.provision "file", source: "ssh/id_rsa", destination: "~/.ssh/id_rsa"
  config.vm.provision "file", source: "ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
  config.vm.provision "shell", inline: "chmod 0600 ~/.ssh/id_rsa", privileged: false

  config.vm.provider ENV["PROVIDER"] do |vb|
    vb.cpus = ENV["NODE_CPUS"]
    vb.memory = ENV["NODE_MEMORY_MB"]
  end

  (1..ENV["NUM_OF_NODES"].to_i).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.12.#{100 + i}"

      if i == 1 then
        node.hostmanager.aliases = "traefik.#{ENV["SWARM_DOMAIN"]} portainer.#{ENV["SWARM_DOMAIN"]} #{ENV["SWARM_DOMAIN"]}"
        node.vm.provision "shell", inline: "envsubst < /vagrant/ansible/ansible.cfg.tpl > /vagrant/ansible/ansible.cfg", env: {"NUM_OF_NODES" => ENV["NUM_OF_NODES"]}
        node.vm.provision "shell", inline: "envsubst < /vagrant/ansible/group_vars/all.tpl > /vagrant/ansible/group_vars/all", env: {"SWARM_DOMAIN" => ENV["SWARM_DOMAIN"]}
        node.vm.provision "shell", inline: "echo 'export ANSIBLE_CONFIG=/vagrant/ansible/ansible.cfg' > /etc/profile.d/ansible.sh"
        node.vm.provision "shell" do |s|
          s.inline = <<-SHELL
            sudo apt update
            sudo apt install -y software-properties-common
            sudo add-apt-repository --yes --update ppa:ansible/ansible
            sudo apt install -y ansible
          SHELL
        end
      end

      node.trigger.after :up do |trigger|
        if i == ENV["NUM_OF_NODES"].to_i then
          trigger.info = "Running ansible provisioning!"
          trigger.run_remote = {inline: "ssh -o StrictHostKeyChecking=no node1 'ANSIBLE_CONFIG=/vagrant/ansible/ansible.cfg ansible-playbook /vagrant/ansible/swarm_playbook.yaml'", privileged: false}
        end
      end
    end
  end
end

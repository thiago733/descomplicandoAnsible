Vagrant.configure("2") do |config|
    (1..3).each do |i|
      config.vm.define "ansible0#{i}" do |ansible|
        ansible.vm.box = "ubuntu/focal64"
        ansible.vm.network "public_network", bridge: "wlp2s0", ip:"192.168.15.12#{i}"
        ansible.vm.hostname = "ansible0#{i}"
        ansible.vm.provision "shell",  path: "scripts/atualizaSistemaOperacionalViaApt.sh"
        (1..3).each do |j|
          ansible.vm.provision "shell",  inline: "echo 192.168.15.12#{j} ansible0#{j}>> /etc/hosts"
        end
      config.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 4
      end
    end
  end
end

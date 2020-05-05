Vagrant.require_version ">= 2.2.6"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	numNodes = 4
	r = numNodes..1
	(r.first).downto(r.last).each do |i|
		config.vm.define "node-#{i}" do |node|
            node.vm.box = "centos/8"
			node.vm.provider "virtualbox" do |v|
			  v.name = "node#{i}"
			  v.customize ["modifyvm", :id, "--memory", "3072"]
            end
            node.vm.network :private_network, ip: "10.211.55.10#{i}"
            
            node.vm.hostname = "node#{i}"
            node.vm.provision "shell", path: "scripts/setup-centos.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-centos-hosts.sh"
				s.args = "-t #{numNodes}"
			end

			if i == 2
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 3 -t #{numNodes}"
				end
            end
  
			if i == 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 2 -t #{numNodes}"
				end
            end
		   
			node.vm.provision "shell", path: "scripts/setup-java.sh"
			node.vm.provision "shell", path: "scripts/setup-hadoop.sh"

			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-hadoop-slaves.sh"
				s.args = "-s 3 -t #{numNodes}"
			end
=begin	
			node.vm.provision "shell", path: "scripts/setup-spark.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-spark-slaves.sh"
				s.args = "-s 3 -t #{numNodes}"
            end
=end

			if i < 3
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-cluster.sh"
					s.args = "-n #{i}"
				end
			end

			if i == 1
				node.vm.network :forwarded_port, guest: 9870, host: 9870, id: 'namenode'
			end

			if i == 2
				node.vm.network :forwarded_port, guest: 8088, host: 8088, id: 'yarn'
				node.vm.network :forwarded_port, guest: 19888, host: 19888, id: 'job-history'
			end

			if i == 3
				node.vm.network :forwarded_port, guest: 9864, host: 9864, id: 'datanode'
				node.vm.network :forwarded_port, guest: 8042, host: 8042, id: 'datanode'
			end

			if i == 4
				node.vm.network :forwarded_port, guest: 9864, host: 9865, id: 'datanode'
				node.vm.network :forwarded_port, guest: 8042, host: 8043, id: 'datanode'
			end

		end
	end
end

=begin
netstat -tulnp

yarn jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.3.jar pi 16 1000

=end
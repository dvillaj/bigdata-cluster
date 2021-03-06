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
			  v.customize ["modifyvm", :id, "--memory", "4096"]
            end
			node.vm.network :private_network, ip: "10.211.55.10#{i}"
			node.ssh.insert_key = false
            
            node.vm.hostname = "node#{i}"
            node.vm.provision "shell", path: "scripts/setup-centos.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-centos-hosts.sh"
				s.args = "-t #{numNodes}"
			end

			node.vm.provision "shell", path: "scripts/setup-java.sh"
			node.vm.provision "shell", path: "scripts/setup-hadoop.sh"

			if i == 2
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 3 -t #{numNodes}"
				end

				node.vm.provision "shell", path: "scripts/setup-hive.sh"
            end
  
			if i == 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 2 -t #{numNodes}"
				end
		   
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-mysql.sh"
					s.args = "10.211.55.10#{i}"
				end

				node.vm.provision "shell", path: "scripts/setup-python.sh"

            end
		   
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-hadoop-slaves.sh"
				s.args = "-s 3 -t #{numNodes}"
			end

			node.vm.provision "shell", path: "scripts/setup-spark.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-spark-slaves.sh"
				s.args = "-s 3 -t #{numNodes}"
            end

			if i < 3
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-cluster.sh"
					s.args = "-n #{i}"
				end
			end

		end
	end
end

=begin
netstat -tulnp

yarn jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar pi 16 1000


$SPARK_HOME/bin/spark-submit --class org.apache.spark.examples.SparkPi \
    --master yarn-cluster \
    --num-executors 10 \
    --executor-cores 2 \
    /usr/local/spark/examples/jars/spark-examples*.jar \
	100
	
$SPARK_HOME/bin/spark-shell --master spark://node1:7077


http://www.mtitek.com/tutorials/bigdata/hive/install.php


vi /etc/systemd/system/hive-metastore.service 
sudo systemctl disable hive-metastore.service
sudo systemctl daemon-reload
sudo systemctl start hive-metastore.service
sudo systemctl status hive-metastore.service

ansible -m ping -i ./resources/ansible/config/hosts all
ansible-playbook -i ./resources/ansible/config/hosts  ./resources/ansible/playbooks/ping.yaml
ansible-playbook -i ./resources/ansible/config/hosts  ./resources/ansible/playbooks/copy-resources.yaml


https://github.com/sdwangntu/hadoop-cluster
https://hadoop.apache.org/docs/r3.2.1/hadoop-project-dist/hadoop-common/ClusterSetup.html
=end
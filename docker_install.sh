cp /tmp/DOCKER_CENTOS_BUILD/docker.repo  /etc/yum.repos.d/docker.repo

sudo yum repolist
sudo yum install docker-engine btrfs-progs btrfs-progs-devel -y
sudo /tmp/DOCKER_CENTOS_BUILD/prepare_disk.sh 
sudo docker-storage-config -s btrfs -d /dev/sdb1
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo echo "alias docker=\"sudo /usr/bin/docker\"" >> /home/nsunke/.bash_profile
docker ps
systemctl restart docker.service
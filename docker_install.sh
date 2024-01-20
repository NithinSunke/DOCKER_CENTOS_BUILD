#cp /tmp/DOCKER_CENTOS_BUILD/docker.repo  /etc/yum.repos.d/docker.repo

yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum repolist
sudo yum install  docker-ce btrfs-progs btrfs-progs-devel -y
sudo sh /tmp/DOCKER_CENTOS_BUILD/prepare_disks.sh 
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo echo "alias docker=\"sudo /usr/bin/docker\"" >> /home/nsunke/.bash_profile
docker ps
systemctl restart docker.service
#cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service.orig
#sed -i 's/old_string/new_line/' /lib/systemd/system/docker.service
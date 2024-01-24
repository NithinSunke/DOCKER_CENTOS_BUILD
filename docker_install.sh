yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum repolist
sudo yum install docker-ce btrfs-progs btrfs-progs-devel -y
sudo sh /tmp/DOCKER_CENTOS_BUILD/prepare_disks.sh 
sudo echo "alias docker=\"sudo /usr/bin/docker\"" >> /home/nsunke/.bash_profile
docker ps
mkfs.btrfs -f -L docker1 /dev/mapper/dockerfs1
systemctl stop docker.service
rm -Rf /var/lib/docker
mkdir /var/lib/docker
echo "LABEL=docker1  /var/lib/docker btrfs defaults 0 0" >> /etc/fstab
mount /var/lib/docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

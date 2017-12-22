#/bin/bash

set -x
apt-get clean
apt-get update
apt-get -y install chrony --force-yes
apt-get -y install software-properties-common --force-yes
add-apt-repository -y cloud-archive:mitaka
#ubuntu-cloud-keyring
apt-get -y update && apt-get -y dist-upgrade --force-yes
apt-get -y install python-openstackclient --force-yes
echo "<<<<<<<安装Mysql>>>>>>>>"
export MYSQL_ROOT=root
echo "rabbit的密码:$MYSQL_ROOT"
echo "mariadb-server-5.5 mysql-server/root_password password $MYSQL_ROOT" | sudo debconf-set-selections
echo "mariadb-server-5.5 mysql-server/root_password_again password $MYSQL_ROOT" | sudo debconf-set-selections
apt-get -y install mariadb-server python-pymysql --force-yes
apt-get -y install rabbitmq-server --force-yes
apt-get -y install memcached python-memcache --force-yes
apt-get -y install keystone apache2 libapache2-mod-wsgi --force-yes
apt-get -y install glance --force-yes
apt-get -y install nova-api nova-conductor nova-consoleauth nova-novncproxy nova-scheduler --force-yes
apt-get -y install neutron-server neutron-plugin-ml2  python-neutronclient neutron-openvswitch-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent --force-yes
apt-get -y install openstack-dashboard --force-yes
apt-get -y install python-pip --force-yes
apt-get -y install dpkg-dev --force-yes

apt-get -y install nova-compute-libvirt --force-yes
apt-get -y install nova-compute-kvm --force-yes
apt-get -y install python-nova --force-yes
apt-get -y install nova-common --force-yes
apt-get -y install nova-compute --force-yes
apt-get -y install neutron-openvswitch-agent --force-yes

# apt-get -y install erlang-nox --force-yes
# apt-get -y install zip --force-yes
# apt-get -y install python-django-horizon --force-yes

安装打包的工具
apt-get install dpkg-dev


安装需要的包
apt-get install XXX

所有的包会下载到
/var/cache/apt/archives/


把所有包复制到
mkdir /var/debs/
cp -r /var/cache/apt/archives /var/debs
/var/debs/
sudo chmod -R 777 /var/debs/
dpkg-scanpackages /var/debs/ /dev/null |gzip > /var/debs/Packages.gz -r
cp /var/debs/Packages.gz //var/debs/archives/Packages.gz

deb file:/var debs/
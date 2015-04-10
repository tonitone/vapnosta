#!/bin/bash

# your settings
DB_ROOT_PW=123
NODE_VERSION="v0.12.2"
NODE_INSTALL_LOGFILE="/vagrant/node_install_log.txt"

apt-get update &> /dev/null

# Install Utils
echo -e "--> Install Utils ...\n"
sudo apt-get install build-essential libssl-dev pkg-config -y &> /dev/null

echo -e "--> Install mcrypt ...\n"
# install mcrypt
sudo apt-get install php5-mcrypt -y &> /dev/null
sudo php5enmod mcrypt &> /dev/null

# php
echo -e "--> Install PHP ...\n"
apt-get install php5-cli php5-mysql php5-gd php5-xdebug php5-fpm nginx -y &> /dev/null

# mysql
echo -e "--> Install MySQL specific packages and settings ...\n"
echo "mysql-server mysql-server/root_password password $DB_ROOT_PW" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DB_ROOT_PW" | debconf-set-selections
apt-get -y install mysql-server-5.5 &> /dev/null

# nginx config
echo -e "--> Install nginx ...\n"
rm -rf /etc/nginx/sites-enabled/*
rm -rf /etc/nginx/sites-available/*
cp /vagrant/vhosts/*vhost /etc/nginx/sites-available/ &> /dev/null
ln -s /etc/nginx/sites-available/*vhost /etc/nginx/sites-enabled/
service nginx restart &> /dev/null

# Install Composer
echo -e "--> Install Composer ...\n"
curl -sS https://getcomposer.org/installer | php &> /dev/null
sudo mv composer.phar /usr/local/bin/composer

# Install git
echo -e "--> Install Git ...\n"
sudo apt-get install git -y &> /dev/null

# Install Vim and Vundle
echo -e "--> Install Vim ...\n"
sudo apt-get install vim -y &> /dev/null
if [ ! -d "/home/vagrant/.vim/bundle/Vundle.vim" ]; then
	echo -e "--> Install Vundle and Vim Plugin ...\n"
	git clone -q https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim &> /dev/null
	cp /vagrant/vim/.vimrc /home/vagrant/.vimrc
	vim +PluginInstall +qall &> /dev/null
else
	echo -e "--> Updating your Vim-Plugins ...\n"
	vim +PluginUpdate +qall &> /dev/null
fi

# Build Node
if ! type -p node; then
	echo -e "--> Build Node from github-sources ...\n"
	mkdir -p /home/vagrant/download/node/
	cd /home/vagrant/download/node/
	git clone -q https://github.com/joyent/node.git &> /dev/null
	cd node
	touch $NODE_INSTALL_LOGFILE
	echo -e "Lay back and relax, I will compile 'node' $NODE_VERSION for you. You can watch the status in the $NODE_INSTALL_LOGFILE-file \n"
	git checkout $NODE_VERSION >> $NODE_INSTALL_LOGFILE 2>&1
	./configure >> $NODE_INSTALL_LOGFILE 2>&1
	make >> $NODE_INSTALL_LOGFILE 2>&1
	sudo make install  >> $NODE_INSTALL_LOGFILE 2>&1
	echo -e "node -v"
	node -v
	echo -e "npm -v"
	npm -v
else
	echo -e "--> 'node' exists. If you wish a new 'node' install, uninstall it first! \n"
fi
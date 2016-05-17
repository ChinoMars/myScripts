#!/bin/sh
# update to latest
yum -y update
yum -y upgrade

# install vim
echo "====== begin to install vim ======"
if [ -x "/usr/bin/vim" ];then
	echo "vim already exists"
else
	yum -y install vim-enhanced
fi
echo "vim install finished!"

echo "begin to config my vim config!"
cd
wget https://github.com/sickill/vim-monokai/blob/master/colors/monokai.vim
if [ -x monokai.vim ];then
	mv ~/monokai.vim /usr/share/vim/vim74/colors/
fi
echo "use monokai color scheme"

echo "syntax on">>.vimrc
echo "set nu">>.vimrc
echo "colorscheme monokai">>.vimrc
echo "set showmatch">>.vimrc
echo "set matchtime=1">>.vimrc
echo "set tabstop=4">>.vimrc
echo "set shifwidth=4">>.vimrc
echo "set autoindent">>.vimrc
echo "set fileencodings=utf-8,gbk">>.vimrc
echo "set encoding=euc-cn">>.vimrc
echo "set ambiwidth=double">>.vimrc

# install locate tool 
echo "====== begin to install locate ======"
if [ -x "/usr/bin/locate" ]
	echo "loacate already exists"
else
	yum -y install mlocate
fi
echo "locate install finished!"

# install shadowsocks
# install python-setuptools and install easy_install, then pip
yum install -y python-setuptools
easy_install pip
pip install shadowsocks

# config the shadowsocks
if [ ! -d /etc/shadowsocks ];then
	mkdir /etc/shadowsocks
fi

if [ ! -x /etc/shadowsocks/config.json ];then
	touch /etc/shadowsocks/config.json
fi

cd /etc/shadowsocks
echo "{">config.json
echo "	\"server\":\"\",">>config.json
echo "	\"server_port\":,">>config.json
echo "	\"local_address\":\"127.0.0.1\",">>config.json
echo "	\"local_port\":1080,">>config.json
echo "	\"password\":\"\",">>config.json
echo "	\"timeout\":600,">>config.json
echo "	\"method\":\"aes-256-cfb\""config.json
echo "}">>config.json

cd

# ask whether install gevent
#read -p "Do you want to install gevent to improve SS performance?[y/n]:" choice
#if [ "$choice" == "y" ]||[ "$choice" == "Y" ];then
#yum -y install libevent

# finish SS installing but still need to config the server ip and server port
echo "Shadowsocks finished installing, please go ahead to config the server in /etc/shadowsocks/config.json"

# update
yum -y update
yum -y upgrade





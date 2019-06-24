- [Linux](#Linux)
  - [网络](#网络)
    - [将 [interip] 映射到 [openip]](#将-interip-映射到-openip)
    - [将所有网段映射到公网 ip](#将所有网段映射到公网-ip)
  - [scp](#scp)
    - [将本地文件拷贝至远程服务器](#将本地文件拷贝至远程服务器)
    - [从远程服务器拷贝文件](#从远程服务器拷贝文件)
  - [进程控制](#进程控制)
    - [后台执行命令](#后台执行命令)
    - [杀掉后台进程](#杀掉后台进程)
    - [根据端口查看进程](#根据端口查看进程)
  - [例子](#例子)
    - [卸载 Mongo](#卸载-Mongo)
    - [tar](#tar)
    - [安装 Nodejs](#安装-Nodejs)
    - [自建 Https 服务](#自建-Https-服务)

# Linux
## 网络
### 将 [interip] 映射到 [openip]
```sh
iptables -t nat -A POSTROUTING -s $interip/24 -o eth0 -j SNAT --to $openip
```

### 将所有网段映射到公网 ip
```sh
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

## scp
### 将本地文件拷贝至远程服务器
```sh
scp -p $port $localfile $username@$server:$remotepath
```
### 从远程服务器拷贝文件
```sh
scp -r $user@$remote:$filepath $localpath
```

## 进程控制
### 后台执行命令
```sh
nohup $command &>/dev/null &
```

### 杀掉后台进程
```sh
kill -9 $pid
```

### 根据端口查看进程
```sh
lsof -i :$port
# command pid user fd type device size/off node name
# 第二种
netstat -tulpn | grep $port
# 行尾 pid/name
```

## 例子

### 卸载 Mongo
```sh
# 停止 mongo 服务
sudo service mongod stop

# 移除 packages
sudo apt-get purge mongodb-org*

# 移除数据目录
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb
```

### tar
```sh
# 生成压缩包
tar -czvf $tainame.tar.gz $files

# 提取包
tar -xzvf $tarname.tar.gz
```

### 安装 Nodejs
> [原文链接](https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/)
```sh
# Add Nodejs PPA
## 当前的版本
sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
## LTS 版本
sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# 安装 Nodejs
sudo apt-get install nodejs
```

### 自建 Https 服务

> [原文链接](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04)
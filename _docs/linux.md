- [Linux](#linux)
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

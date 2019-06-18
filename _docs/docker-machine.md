- [docker-machine](#docker-machine)
  - [命令行使用方法](#命令行使用方法)
    - [新建虚拟机](#新建虚拟机)
    - [删除虚拟机](#删除虚拟机)
    - [从虚拟机挂载目录到主机](#从虚拟机挂载目录到主机)
    - [ssh 连接虚拟机](#ssh-连接虚拟机)
  - [使用例子](#使用例子)
    - [新建配置阿里云镜像地址的 Docker 虚拟机](#新建配置阿里云镜像地址的-Docker-虚拟机)
  - [参考链接](#参考链接)
# docker-machine

## 命令行使用方法
### 新建虚拟机
```sh
docker-machine create --engine-registry-mirror=$mirrorurl -d $provider $vmname
```

### 删除虚拟机
```sh
docker-machine rm $vmname
```

### 从虚拟机挂载目录到主机
```sh
# 主机新建共享目录
mkdir $localpath

# 虚拟机新建目录
docker-machine ssh $vmname mkdir $vmpath

# 挂载目录
docker-machine mount $vmname:$vmpath $localpath
```

### ssh 连接虚拟机
```sh
dokcer-machine --native-ssh ssh $vmname $command
```

## 使用例子
### 新建配置阿里云镜像地址的 Docker 虚拟机
> [官网地址](https://cr.console.aliyun.com/cn-beijing/instances/mirrors)

先按照官网进行注册。

```sh
# 创建指定 docker 镜像的虚拟机 default
docker-machine create --engine-registry-mirror=$alimirrorurl -d $provider default

# 关闭虚拟机，新增固定共享目录
vboxmanage controlvm default savestate
vboxmanage controlvm default poweroff
vboxmanage sharedfolder add default --name $sharename --hostpath $hostpath
vboxmanage startvm default --type headless

# 新建共享目录
docker-machine ssh default sudo mkdir $vmpath

# 修改目录权限
docker-machine ssh default sudo chmod 777 $vmpath

# 挂载共享目录
docker-machine ssh default sudo mount -t vboxsf -o uid=1000,gid=1000 $sharename $vmpath
```

## 参考链接
1. [docker-machine 官网](https://docs.docker.com/machine/overview/)
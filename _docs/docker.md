- [Docker](#docker)
  - [镜像](#镜像)
    - [列出本机的所有 image 文件](#列出本机的所有-image-文件)
    - [删除 image 文件](#删除-image-文件)
    - [从远程拉去镜像](#从远程拉去镜像)
    - [创建 image 文件](#创建-image-文件)
    - [为本地的image标注用户名和版本](#为本地的image标注用户名和版本)
    - [发布](#发布)
  - [容器](#容器)
    - [运行容器](#运行容器)
    - [后台启动镜像](#后台启动镜像)
    - [杀掉容器](#杀掉容器)
    - [列出本机正在运行的容器](#列出本机正在运行的容器)
    - [列出本机所有容器，包括终止运行的容器](#列出本机所有容器包括终止运行的容器)
    - [从硬盘删除容器](#从硬盘删除容器)
    - [从 image 文件生成容器](#从-image-文件生成容器)
    - [从 image 文件生成容器](#从-image-文件生成容器-1)
    - [在容器终止运行后自动删除容器文件](#在容器终止运行后自动删除容器文件)
    - [进行收尾清理工作](#进行收尾清理工作)
    - [查看容器的输出](#查看容器的输出)
    - [进入容器](#进入容器)
    - [从正在运行的容器中拷贝文件到本地](#从正在运行的容器中拷贝文件到本地)
  - [容器命令行](#容器命令行)
  - [其它](#其它)
    - [重复使用容器](#重复使用容器)
    - [发布镜像](#发布镜像)
    - [将镜像保存成本地文件](#将镜像保存成本地文件)
    - [安装本地镜像](#安装本地镜像)
  - [Windows Docker 配置](#windows-docker-配置)
    - [新建 Docker 环境的虚拟机，并配置镜像地址](#新建-docker-环境的虚拟机并配置镜像地址)
    - [通过客户端访问 Docker 服务](#通过客户端访问-docker-服务)
    - [删除 Docker 虚拟机](#删除-docker-虚拟机)

# Docker

## 镜像
### 列出本机的所有 image 文件
```sh
docker image ls
```

### 删除 image 文件
```sh
docker image rm $imagename
```

### 从远程拉去镜像
```sh
docker image pull $group/$imagename
```

### 创建 image 文件
```sh
docker image build -t $DockerFile[:$version]
```
### 为本地的image标注用户名和版本
```sh
docker image tag $imagename $username/$repository:$tag

# 实例
docker image tag koa-demo:0.0.1 [group]/[imagename:version]
```

### 发布
```sh
docker image push $username/$repository:$tag
```

## 容器
### 运行容器
```sh
docker container run $imagename
```

### 后台启动镜像
```sh
docker container run -it ubuntu bash
```

### 杀掉容器
```sh
docker container kill $containID
```

### 列出本机正在运行的容器
```sh
docker container ls
```

### 列出本机所有容器，包括终止运行的容器
```sh
docker container ls -all
```

### 从硬盘删除容器
```sh
docker container rm $containID
```

### 从 image 文件生成容器
docker container run -p 8000:3000 -it $DockerFile /bin/bash

### 从 image 文件生成容器
```sh
docker container run -p 8000:3000 -it $DockerFile[:$version] /bin/bash
```

### 在容器终止运行后自动删除容器文件
```sh
docker cotainer run --rm -p 8000:3000 -it koa-demo /bin/bash
```

### 进行收尾清理工作
```sh
docker container stop $containerID
```

### 查看容器的输出
```sh
docker container logs $containerID
```

### 进入容器
```sh
docker container exec -it $containerID /bin/bash
```

### 从正在运行的容器中拷贝文件到本地
```sh
docker container cp $containerID:$path
```

## 容器命令行

Ctrl + c 停止 node 进程
Ctrl + d （或 exit）退出容器

## 其它

### 重复使用容器
```sh
docker start $containerID
```

### 发布镜像
```sh
docker login
```

### 将镜像保存成本地文件
```sh
docker save -o $filename.tar $imagename
```

### 安装本地镜像
```sh
docker load --input $filename.tar
```

## Windows Docker 配置
### 新建 Docker 环境的虚拟机，并配置镜像地址
```sh
docker-machine create --engine-registry-mirror=$mirrorurl -d virtualbox default
```

### 通过客户端访问 Docker 服务
```sh
docker-machine env default
eval "$(docker-machine env [vmname])"
```

### 删除 Docker 虚拟机
```sh
docker-machine rm $vmname
```
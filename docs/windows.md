
- [windows 系统常用的命令](#windows-系统常用的命令)
  - [网络](#网络)
    - [添加路由](#添加路由)
  - [文件管理](#文件管理)
    - [删除文件夹](#删除文件夹)
  - [Docker](#docker)
    - [配置 Docker 国内加速器](#配置-docker-国内加速器)
  - [Git Bash 工具](#git-bash-工具)
    - [启动一个 bash 环境，依据 Git Bash](#启动一个-bash-环境依据-git-bash)

# windows 系统常用的命令

## 网络

### 添加路由
router -p add [interip] mask 255.255.0.0 [visualip]

## 文件管理

### 删除文件夹
rd /s /q [path]

## Docker

### 配置 Docker 国内加速器
[阿里云文档](https://cr.console.aliyun.com/cn-beijing/instances/mirrors)


## Git Bash 工具

### 启动一个 bash 环境，依据 Git Bash
"C:\Program Files\Git\bin\bash.exe" --login -i "[pathofscript.sh]"
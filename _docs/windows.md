
- [windows 系统常用的命令](#windows-系统常用的命令)
  - [网络](#网络)
    - [添加路由](#添加路由)
  - [文件管理](#文件管理)
    - [删除文件夹](#删除文件夹)
  - [Docker](#Docker)
    - [配置 Docker 国内加速器](#配置-Docker-国内加速器)
  - [WSL](#WSL)
  - [Git Bash 工具](#Git-Bash-工具)
    - [启动一个 bash 环境，依据 Git Bash](#启动一个-bash-环境依据-Git-Bash)

# windows 系统常用的命令

## 网络

### 添加路由
```sh
router -p add [interip] mask 255.255.0.0 [visualip]
```

## 文件管理

### 删除文件夹
```sh
rd /s /q [path]
```

## Docker

### 配置 Docker 国内加速器
[阿里云文档](https://cr.console.aliyun.com/cn-beijing/instances/mirrors)

## WSL

> 子系统的根目录在 windows10 的路径:
> C:\Users\%USER%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs



## Git Bash 工具

### 启动一个 bash 环境，依据 Git Bash
```cmd
"C:\Program Files\Git\bin\bash.exe" --login -i "[pathofscript.sh]"
```
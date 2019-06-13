- [VisualBox 管理](#visualbox-管理)
  - [查看虚拟机列表](#查看虚拟机列表)
  - [启动一个虚拟机](#启动一个虚拟机)
  - [强制退出虚拟机](#强制退出虚拟机)
  - [虚拟机链接共享文件夹](#虚拟机链接共享文件夹)
  

# VisualBox 管理

## 查看虚拟机列表
```sh
vboxmanage list vms
```

## 启动一个虚拟机

```sh
vboxmanage startvm $vmname
```

## 强制退出虚拟机
```sh
vboxmanage controlvm $vmname poweroff
```

## 虚拟机链接共享文件夹
```sh
sudo mkdir $localsharepath
sudo chmod 777 $localsharepath
sudo mount -t vboxsf -o uid=1000,gid=1000 $createsharepath $localsharepath
```
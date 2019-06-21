- [VisualBox 管理](#VisualBox-管理)
  - [vboxmanage 命令行使用](#vboxmanage-命令行使用)
    - [查看虚拟机列表](#查看虚拟机列表)
    - [启动一个虚拟机](#启动一个虚拟机)
    - [虚拟机控制](#虚拟机控制)
    - [删除虚拟机](#删除虚拟机)
    - [共享目录](#共享目录)
  - [例子](#例子)
  

# VisualBox 管理

## [vboxmanage 命令行使用](https://www.virtualbox.org/manual/ch08.html#vboxmanage-list)
### 查看虚拟机列表
```sh
vboxmanage list vms
```

### 启动一个虚拟机

```sh
vboxmanage startvm $vmname

# 无界面启动
vboxmanage startvm $vmname --type headless
```

### 虚拟机控制
```sh
# 关机
vboxmanage controlvm $vmname poweroff

# 保存虚拟机状态
vboxmanage controlvm $vmname savestate
```

### 删除虚拟机
```sh
vboxmanage unregistervm --delete $vmname 
```

### 共享目录
```sh
# 新增共享目录（虚拟机未启动）
vboxmanage sharedfolder add $vmname --name $sharename --hostpath $hostpath

# 新增临时分配共享目录
vboxmanage sharedfolder add $vmname --name $sharename --hostpath $hostpath --transient

## 删除共享目录
vboxmanage sharedfolder remove $vmname --name $sharename [--transient]
```

## 例子

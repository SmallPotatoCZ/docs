- [建立多个 github 账号的 ssh-key](#建立多个-github-账号的-ssh-key)
  - [创建不同的公钥](#创建不同的公钥)
  - [修改你的 ssh 配置文件](#修改你的-ssh-配置文件)
  - [更改 Host key（可以不做）](#更改-Host-key可以不做)
  - [验证能否连接](#验证能否连接)
  - [对项目目录修改使用的 ssh 账号](#对项目目录修改使用的-ssh-账号)
  - [FAQ](#FAQ)
  - [参考链接](#参考链接)
# 建立多个 github 账号的 ssh-key

## 创建不同的公钥

创建不同的 ssh key

```sh
ssh-keygen -t rsa -C "your_email@youremail.com"
```

下面是创建的两个 key

```sh
~/.ssh/id_rsa_num01
~/.ssh/id_rsa_num02
```

下一步像下面一样，增加这两个 key

```sh
ssh-add ~/.ssh/id_rsa_num01
ssh-add ~/.ssh/id_rsa_num02
```

在 windows 环境下，如果出现 `Could not open a connection to your authentication agent.
`

需要先执行如下命令
**windows 需要在 git bash 中执行**
```sh
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa_num01
ssh-add ~/.ssh/id_rsa_num02
```

可以删除之前缓存的 key

```sh
ssh-add -D
```

最后可以查看已保存的 key

```sh
ssh-add -l
```

## 修改你的 ssh 配置文件

config 字段的解释

```
Host vps(这里是自定义的host简称,以后连接远程服务器就可以用命令ssh vps) 
User 这里填用户名(如:root) 
HostName 这里填服务器地址也可以是域名(如:server.xxoo.com) 
Port 这里填服务器 open-ssh 端口(默认:22) 
IdentityFile 这里是刚刚生成的私钥文件地址(如 ~/.ssh/id_rsa) 
```

config 示例

```sh
cd ~/.ssh
touch config
# 也可以通过其他方式进行修改
subl -a config

# 增加的内容，'PreferredAuthentications publickey' 可忽略
# num01 - github 的用户名称
Host num01.github.com
HostName github.com
User git
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_num01

# num02 - github 的用户名称
Host num02.github.com
HostName github.com
User git
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_num02
```

## 更改 Host key（可以不做）

```sh
ssh -o StrictHostKeyChecking=no git@num01.github.com
ssh -o StrictHostKeyChecking=no git@num02.github.com
```

## 验证能否连接

```sh
ssh -T git@num01.github.com
ssh -T git@num02.github.com
```

## 对项目目录修改使用的 ssh 账号

```sh
git config user.name "num01"
git config user.email "num01@gmail.com" 

# git 的正常管理
```

## FAQ

- 先从 github 远程仓库 pull 拉取项目，但是 git push 时，`ERROR: Permission to A/docsEditor.git denied to B.`
```sh
# 查看远程地址
git remote -v
# git@github.com:B/***

# 查看 .ssh 下的 config 配置文件
Host github.com
HostName github.com
User git
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_A

Host B.github.com
HostName github.com
User git
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_B

# 上述问题是，更具远程地址去 config 中匹配公钥时，出现不匹配的情况

# 解决方案
# 在项目目录下，修改 git remote 地址
git remote set-url origin git@B.github.com:B/***

```

## 参考链接

> [github 某一个 gist](https://gist.github.com/jexchan/2351996)
> [medium 文章](https://medium.com/@trionkidnapper/ssh-keys-with-multiple-github-accounts-c67db56f191e)
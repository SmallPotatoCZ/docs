- [Nginx](#nginx)
  - [配置文件默认位置](#配置文件默认位置)
  - [关闭](#关闭)
  - [重新加载配置文件](#重新加载配置文件)
  - [重新打开日志文件](#重新打开日志文件)
  - [立马关闭](#立马关闭)
# Nginx

## 配置文件默认位置
/etc/nginx

## 关闭
```sh
nginx -s quit
```

## 重新加载配置文件
```sh
nginx -s reload
```

## 重新打开日志文件
```sh
nginx is reopen
```

## 立马关闭
```sh
nginx -s stop
```
- [配置本地 HTTPS](#配置本地-HTTPS)
  - [生成证书](#生成证书)
  - [安装证书](#安装证书)
  - [参考链接](#参考链接)

# 配置本地 HTTPS 

## 生成证书
```sh
openssl req -new -sha256 -newkey rsa:2048 -nodes \ 
-keyout dev.zc.com.key \ 
-x509 -days 365 -out dev.zc.com.crt
```

其中的 Common Name 是重要的。

`openssl` 根据 SAN(Subject Alternative Name) 配置文件生成证书。

```sh
openssl req -config dev.zc.com.conf -new -sha256 -newkey rsa:2048 \
-nodes -keyout dev.zc.com.key -x509 -days 365 \
-out dev.zc.com.crt
```

SAN 配置文件内容:

```config
[ req ]

default_bits        = 2048
default_keyfile     = server-key.pem
distinguished_name  = subject
req_extensions      = req_ext
x509_extensions     = x509_ext
string_mask         = utf8only

[ subject ]

countryName                 = Country Name (2 letter code)
countryName_default         = US

stateOrProvinceName         = State or Province Name (full name)
stateOrProvinceName_default = NY

localityName                = Locality Name (eg, city)
localityName_default        = New York

organizationName            = Organization Name (eg, company)
organizationName_default    = Example, LLC

commonName                  = Common Name (e.g. server FQDN or YOUR name)
commonName_default          = Example Company

emailAddress                = Email Address
emailAddress_default        = sp@zhangchao@gmail.com

[ x509_ext ]

subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid,issuer

basicConstraints       = CA:FALSE
keyUsage               = digitalSignature, keyEncipherment
subjectAltName         = @alternate_names
nsComment              = "OpenSSL Generated Certificate"

[ req_ext ]

subjectKeyIdentifier = hash

basicConstraints     = CA:FALSE
keyUsage             = digitalSignature, keyEncipherment
subjectAltName       = @alternate_names
nsComment            = "OpenSSL Generated Certificate"

[ alternate_names ]

DNS.1       = dev.zc.com
```

修改 DNS.1 的值。

## 安装证书

为 Edge 浏览器安装证书。

打开 edge://settings ,搜索 certificate ，选择【证书管理】

![证书管理](site/assets/manage-certificate.png)

导入证书到受信任的根证书颁发机构。

![导入证书](site/assets/import-root-cretificate.png)

## 参考链接
1. [How to Set Up HTTPS Locally Without Getting Annoying Browser Privacy Errors](https://deliciousbrains.com/https-locally-without-browser-privacy-errors/)
2. [What is the SSL Certificate Subject Alternative Name?](https://support.dnsimple.com/articles/what-is-ssl-san/)
3. [Common Name vs Subject Alternative Name](https://support.dnsimple.com/articles/what-is-common-name/#common-name-vs-subject-alternative-name)
4. [HTTPS工作原理](https://cattail.me/tech/2015/11/30/how-https-works.html)
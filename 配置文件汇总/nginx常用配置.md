---
title: nginx常用配置
sidebar: true
date: 2019-03-12
categories: Nginx 学习笔记
tags:
  - nginx
---

:::tip
nginx 常用配置
:::

<!-- more -->

```bash
# 添加后端负载均衡地址

# 实际项目换成对应后端的域名或 ip

upstream backend {
  //配置负载均衡 IP 或者项目启动 IP
  server your.backend.ip.or.domain weight=1;
}

server {
  # listen 443 ssl;
  # ssl_certificate /etc/nginx/ssl/server-cert.pem;
  # ssl_certificate_key /etc/nginx/ssl/server-key.pem;
  # ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  # ssl_ciphers HIGH:!aNULL:!MD5;
  root /export/App;
  error*log /export/servers/nginx/logs/error.log;
  listen 80 default_server;
  server_name *;

  gzip_static on;
  gzip on;
  gzip_min_length 100;
  gzip_buffers 4 16k;
  gzip_http_version 1.1;
  gzip_comp_level 9;
  gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript application/font-woff;

  location / {
    try_files $uri $uri/ /index.html;
  }

  location ~ /api(?<section>.+)$ {
    proxy_http_version 1.1;
    proxy_set_header   X-Real-IP $remote_addr; //在将客户端请求发送给后端服务器之前，更改来自客户端的请求头信息
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  //在将客户端请求发送给后端服务器之前，更改来自客户端的请求头信息
    proxy_set_header Host $host; //在将客户端请求发送给后端服务器之前，更改来自客户端的请求头信息
    //反向代理配置
    proxy_pass http://backend$section?$args;
  }

  location /asset {
  e xpires 10d;
  }
}
```

<Valine></Valine>

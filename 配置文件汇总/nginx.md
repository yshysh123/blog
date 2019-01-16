# nginx

Nginx 是一款轻量级的 HTTP 服务器，采用事件驱动的异步非阻塞处理方式框架，这让其具有极好的 IO 性能，时常用于服务端的反向代理和负载均衡。

## nginx 优点

- 支持海量高并发：采用 IO 多路复用 epoll。官方测试 Nginx 能够支持 5 万并发链接，实际生产环境中可以支撑 2-4 万并发连接数。
- 内存消耗少：在主流的服务器中 Nginx 目前是内存消耗最小的了，比如我们用 Nginx+PHP，在 3 万并发链接下，开启 10 个 Nginx 进程消耗 150M 内存。
- 免费使用可以商业化：Nginx 为开源软件，采用的是 2-clause BSD-like 协议，可以免费使用，并且可以用于商业。
- 配置文件简单：网络和程序配置通俗易懂，即使非专业运维也能看懂。

## nginx 默认配置

```bash
user  nginx;  //用户
worker_processes  1;  //进程数 一般和cpu个数一样
error_log  /var/log/nginx/error.log warn; //错误日志存放位置
pid        /var/run/nginx.pid;   //nginx存放pid位置
events {
  worker_connections  1024;  //后台允许最大并发数
}
http {
  include       /etc/nginx/mime.types; //文件扩展名映射表
  default_type  application/octet-stream;  //默认文件类型
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';  //设置日志模式
  access_log  /var/log/nginx/access.log  main; //访问日志存放位置
  sendfile        on;  //开启告诉传输模式
  #tcp_nopush     on;  //减少网络报文数量
  keepalive_timeout  65;  //保持连接时间
  #gzip  on;  //开启gzip
  include /etc/nginx/conf.d/*.conf;  //包含自配置文件位置
}
server {
  listen       80;   #配置监听端口
  server_name  localhost;  //配置域名
  #charset koi8-r;
  #access_log  /var/log/nginx/host.access.log  main;
  location / {
      root   /usr/share/nginx/html;     #服务默认启动目录
      index  index.html index.htm;    #默认访问文件
  }
  #error_page  404              /404.html;   # 配置404页面
  # redirect server error pages to the static page /50x.html
  #
  error_page   500 502 503 504  /50x.html;   #错误状态码的显示页面，配置后需要重启
  location = /50x.html {
      root   /usr/share/nginx/html;
  }
  # proxy the PHP scripts to Apache listening on 127.0.0.1:80
  #
  #location ~ \.php$ {
  #    proxy_pass   http://127.0.0.1;
  #}
  # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
  #
  #location ~ \.php$ {
  #    root           html;
  #    fastcgi_pass   127.0.0.1:9000;
  #    fastcgi_index  index.php;
  #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
  #    include        fastcgi_params;
  #}
  # deny access to .htaccess files, if Apache's document root
  # concurs with nginx's one
  #
  #location ~ /\.ht {
  #    deny  all;
  #}
}
```

## nginx 权限控制

```bash
location / {
  //不允许访问
  deny   127.0.0.0;  all（所有）
  //允许访问
  allow  127.0.0.0;  all（所有）
}
// =为精确匹配符 img请求和目录允许所有访问
location =/img{
  allow all;
}
// =为精确匹配符 admin目录和请求禁止所有用户访问
location =/admin{
  deny all;
}
//以php结尾的都禁止访问
location ~\.php$ {
  deny all;
}
```

- 权限是从上往下执行的，当匹配成功，下面的控制权限就不会执行了

## nginx 常用命令

[nginx 常用命令](./nginx命令.md)

## Nginx 设置虚拟主机

- 创建多个 server 通过修改 listen 不同的端口来设置
- 创建多个 server 通过修改 server_name 不同的 IP 来设置
- 创建多个 server 通过修改 server_name 不同的域名来设置

## Nginx 反向代理

[nginx 反向代理](./nginx反向代理.md)

## Nginx 适配 PC 或移动设备

```bash
server{
  listen 80;
  server_name nginx2.jspang.com;
  location / {
  root /usr/share/nginx/html/pc;
  if ($http_user_agent ~* '(Android|webOS|iPhone|iPod|BlackBerry)') {
    root /usr/share/nginx/html/mobile;
  }
  index index.html;
  }
}
```

## gzip

- gzip : 该指令用于开启或 关闭 gzip 模块。
- gzip_buffers : 设置系统获取几个单位的缓存用于存储 gzip 的压缩结果数据流。
- gzip_comp_level : gzip 压缩比，压缩级别是 1-9，1 的压缩级别最低，9 的压缩级别最高。压缩级别越高压缩率越大，压缩时间越长。
- gzip_disable : 可以通过该指令对一些特定的 User-Agent 不使用压缩功能。
- gzip_min_length:设置允许压缩的页面最小字节数，页面字节数从相应消息头的 Content-length 中进行获取。
- gzip_http_version：识别 HTTP 协议版本，其值可以是 1.1.或 1.0.
- gzip_proxied : 用于设置启用或禁用从代理服务器上收到相应内容 gzip 压缩。
- gzip_vary : 用于在响应消息头中添加 Vary：Accept-Encoding,使代理服务器根据请求头中的 Accept-Encoding 识别是否启用 gzip 压缩。

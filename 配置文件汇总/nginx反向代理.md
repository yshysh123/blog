# 反向代理

## 这个功能是 nginx 的一个亮点。

### 反向代理是什么呢？

    反向代理（Reverse Proxy）方式是指以代理服务器来接受internet上的连接请求，然后将请求转发给内部网络上的服务器，并将从服务器上得到的结果返回给internet上请求连接的客户端，此时代理服务器对外就表现为一个服务器。

    举个例子，比如我想访问 http://www.test.com/readme ，但www.test.com上并不存在readme页面，于是他是偷偷从另外一台服务器上取回来，然后作为自己的内容返回用户，但用户并不知情。这里所提到的 www.test.com 这个域名对应的服务器就设置了反向代理功能。

    正向代理（Forward Proxy）通常都被简称为代理，就是在用户无法正常访问外部资源，比方说受到GFW的影响无法访问twitter的时候，我们可以通过代理的方式，让用户绕过防火墙，从而连接到目标网络或者服务。

    正向代理的工作原理就像一个跳板，比如：我访问不了 google.com，但是我能访问一个代理服务器 A，A 能访问 google.com，于是我先连上代理服务器 A，告诉他我需要 google.com 的内容，A 就去取回来，然后返回给我。从网站的角度，只在代理服务器来取内容的时候有一次记录，有时候并不知道是用户的请求，也隐藏了用户的资料，这取决于代理告不告诉网站。 作者：猿码道: 链接：https://www.jianshu.com/p/bed000e1830b

    通过反向代理，可以实现：

      * 一台机器充分利用多个域名
      * 本地通过 80 端口代理到实际服务的端口，解决调试时端口带来的跨域问题。（不过更也可以用 charles 设定 通过 node proxy 工具如：node-http-proxy, koa-proxy）

### 反向代理的好处

- 安全性：正向代理的客户端能够在隐藏自身信息的同时访问任意网站，这个给网络安全代理了极大的威胁。因此，我们必须把服务器保护起来，使用反向代理客户端用户只能通过外来网来访问代理服务器，并且用户并不知道自己访问的真实服务器是那一台，可以很好的提供安全保护。
- 功能性：反向代理的主要用途是为多个服务器提供负债均衡、缓存等功能。负载均衡就是一个网站的内容被部署在若干服务器上，可以把这些机子看成一个集群，那 Nginx 可以将接收到的客户端请求“均匀地”分配到这个集群中所有的服务器上，从而实现服务器压力的平均分配，也叫负载均衡。

for example:

```bash
server {
    listen 80;
    server_name site1.nginx.com;
    index static/index.html;
    location / {
        root /Users/echizen/demo/nginx-learn/site1;
    }

    location /api {
        proxy_pass http://127.0.0.1:8020;
    }
}

server {
    listen 80;
    server_name site2.nginx.com;
    index static/index.html;
    location / {
        root /Users/echizen/demo/nginx-learn/site2;
    }

    location /api {
        proxy_pass http://127.0.0.1:8021;
    }
}
```

这样访问 http://site1.nginx.com 就能看到 site1 的内容，http://site1.nginx.com/api/* 可以看到 site1 下的接口服务，http://site2.nginx.com 能看到 site2 的内容，http://site2.nginx.com/api/* 可以看到 site2 的接口服务。实现了一台机器上提供多个独立的服务

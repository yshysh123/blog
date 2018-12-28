# 负载均衡

## 这个功能是 nginx 的一个亮点。

### 负载均衡是什么呢？

    负载均衡的好处是可以集群多台机器一起工作，并且对外的IP和域名是一样的，外界看起来就好像一台机器一样。

    举个例子：我们的小网站，刚开始就一台nginx服务器，后来，随着业务量增大，用户增多，一台服务器已经不够用了，我们就又多加了几台服务器。那么这几台服务器如何调度？如何均匀的提供访问？这就是负载均衡。

### 负载均衡的方法

#### 基于 weight 权重的负载

```bash
upstream webservers{
  server 192.168.11.11 weight=10;
  server 192.168.11.12 weight=10;
  server 192.168.11.13 weight=10;
}
```

```bash
upstream webservers{
  server 192.168.11.11 weight=10 max_fails=2 fail_timeout=30s;
  server 192.168.11.12 weight=10 max_fails=2 fail_timeout=30s;
  server 192.168.11.13 weight=10 max_fails=2 fail_timeout=30s;
}
```

- max_fails : \*\*允许请求失败的次数，默认为 1。当超过最大次数时，返回 proxy_next_upstream 模块定义的错误。
- fail_timeout : \*\*在经历了 max_fails 次失败后，暂停服务的时间。max_fails 可以和 fail_timeout 一起使用，进行健康状态检查。

```bash
upstream webservers{
  server 192.168.11.11 down;
  server 192.168.11.12 weight=10 max_fails=2 fail_timeout=30s;
  server 192.168.11.13 backup;
}
```

- down： 表示这台机器暂时不参与负载均衡。相当于注释掉了。
- backup： 表示这台机器是备用机器，是其他的机器不能用的时候，这台机器才会被使用，俗称备胎

#### 基于 ip_hash 的负载

这种分配方式，每个请求按访问 IP 的 hash 结果分配，这样来自同一个 IP 的访客固定访问一个后端服务器，有效解决了动态网页存在的 session 共享问题。

```bash
upstream webservers{
  ip_hash;
  server 192.168.11.11 max_fails=2 fail_timeout=30s;
  server 192.168.11.12 max_fails=2 fail_timeout=30s;
  server 192.168.11.13 down;
}
```

- ip_hash 模式下，最好不要设置 weight 参数，因为你设置了，就相当于手动设置了，将会导致很多的流量分配不均匀。
- ip_hash 模式下，backup 参数不可用，加了会报错，为啥呢？因为，本身我们的访问就是固定的了，其实，备用已经不管什么作用了。

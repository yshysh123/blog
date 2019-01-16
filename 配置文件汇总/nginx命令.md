# nginx 常用命令汇总

- start nginx
  - windows 下再对应 nginx 目录下
  - CMD 启动 nginx
- ps aux | grep nginx
  - 查看 nginx 是否启动
- systemctl start nginx.service
  - 从新启动 nginx
- nginx -s quit
  - 从容停止 nginx
- nginx -s stop
  - 立即停止 nginx
- killall nginx
  - 杀死 nginx 进程
- systemctl stop nginx.service
  - systemctl 关闭 nginx 进程(linux 通用关闭 nginx 方法)
- systemctl restart nginx.service
  - 重启 nginx
- nginx -s reload
  - 重载配置文件
  - 注：每次修改完.conf 文件就需要重启 nginx
- nginx -t
  - 检查配置
  - 检查修改的 nginx.conf 配置是否正确
  - 如果出现下面 ok 和 successfull 就代表正确了，其他的都不对
    ```bash
      nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
      nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful
    ```
- tasklist /fi "imagename eq nginx.exe"
  - 查看 nginx 项目内启动配置
  - 如果出现：信息：没有运行的任务匹配指定标准 说明没有启动 nginx 配置
- netstat -tlnp
  - 查看哪些端口号被占用了
- netstat -aon | findstr :80
  - 查看某端口号是否被占用，如果 nginx 启动不起来，可能是端口号被占用导致。

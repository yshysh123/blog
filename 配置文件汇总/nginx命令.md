# nginx常用命令汇总

* start nginx 
  * windows下再对应nginx目录下 
  * CMD启动nginx
* nginx -s stop 
  * 关闭nginx
* nginx -s reload  
  * 重启nginx 
  * 注：每次修改完.conf文件就需要重启nginx
* nginx -t 
  * 检查配置 
  * 检查修改的nginx.conf配置是否正确
  * 如果出现下面ok和successfull就代表正确了，其他的都不对
    ```bash
      nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
      nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful
    ```
* tasklist /fi "imagename eq nginx.exe"
  * 查看nginx项目内启动配置
  * 如果出现：信息：没有运行的任务匹配指定标准 说明没有启动nginx配置
* netstat -aon | findstr :80
  * 查看某端口号是否被占用，如果nginx启动不起来，可能是端口号被占用导致。
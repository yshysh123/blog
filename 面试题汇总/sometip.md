# 面试题

## nextTick、setImmediate、promise.resolve().then()、setTimeout

```javascript
setImmediate(function() {
  console.log(1);
}, 0);
setTimeout(function() {
  console.log(2);
}, 0);
new Promise(function(resolve) {
  console.log(3);
  resolve();
  console.log(4);
}).then(function() {
  console.log(5);
});
console.log(6);
process.nextTick(function() {
  console.log(7);
});
console.log(8);

//输出结果是3 4 6 8 7 5 2 1
```

## https 获取加密密钥的过程

1. 客户端访问 https 开头的 url

2. 服务端返回公钥 1，客户端验证通过（如果不通过，则访问终断）。

3. 客户端根据公钥 1 生成一个私钥 2，这个私钥 2 用来加密和解密请求信息。使用公钥 1 对私钥 2 进行加密，回传给服务端。服务端用私钥 1 对该信息解密，得到私钥 2。至此，客户端和服务端都已经有了私钥 2。

4. 客户端和服务端之间使用私钥 2 对信息进行加密后通信，这样即使第三方抓包，也无法轻易获取通信内容了。

## Http 的请求方法有哪几种，分别是干什么用的。返回的请求头 header 解释性和缓存分别有哪些。

1. OPTIONS
   返回服务器针对特定资源所支持的 HTTP 请求方法，也可以利用向 web 服务器发送‘\*’的请求来测试服务器的功能性
2. HEAD
   向服务器索与 GET 请求相一致的响应，只不过响应体将不会被返回。这一方法可以再不必传输整个响应内容的情况下，就可以获取包含在响应小消息头中的元信息。
3. GET
   向特定的资源发出请求。它本质就是发送一个请求来取得服务器上的某一资源。资源通过一组 HTTP 头和呈现数据（如 HTML 文本，或者图片或者视频等）返回给客户端。GET 请求中，永远不会包含呈现数据。
4. POST
   向指定资源提交数据进行处理请求（例如提交表单或者上传文件）。数据被包含在请求体中。POST 请求可能会导致新的资源的建立和/或已有资源的修改。 Loadrunner 中对应 POST 请求函数：web_submit_data,web_submit_form
5. PUT
   向指定资源位置上传其最新内容
6. DELETE
   请求服务器删除 Request-URL 所标识的资源
7. TRACE
   回显服务器收到的请求，主要用于测试或诊断
8. CONNECT
   HTTP/1.1 协议中预留给能够将连接改为管道方式的代理服务器。

常用的相应头：

- Access-Control-Allow-Origin 指定哪些网站可以跨域源资源共享 Access-Control-Allow-Origin: \_ 临时
- Accept-Patch 指定服务器所支持的文档补丁格式 Accept-Patch: text/example;charset=utf-8 固定
- Accept-Ranges 服务器所支持的内容范围 Accept-Ranges: bytes 固定
- Age 响应对象在代理缓存中存在的时间，以秒为单位 Age: 12 固定
- Allow 对于特定资源的有效动作; Allow: GET, HEAD 固定
- Cache-Control 通知从服务器到客户端内的所有缓存机制，表示它们是否可以缓存这个对象及缓存有效时间。其单位为秒 Cache-Control: max-age=3600 固定
- Connection 针对该连接所预期的选项 Connection: close 固定
- Content-Disposition 对已知 MIME 类型资源的描述，浏览器可以根据这个响应头决定是对返回资源的动作，如：将其下载或是打开。 Content-Disposition: attachment; - - filename="fname.ext" 固定
- Content-Encoding 响应资源所使用的编码类型。 Content-Encoding: gzip 固定
- Content-Language 响就内容所使用的语言 Content-Language: zh-cn 固定
- Content-Length 响应消息体的长度，用 8 进制字节表示 Content-Length: 348 固定
- Content-Location 所返回的数据的一个候选位置 Content-Location: /index.htm 固定
- Content-MD5 响应内容的二进制 MD5 散列值，以 Base64 方式编码 Content-MD5: IDK0iSsgSW50ZWd0DiJUi== 已淘汰
- Content-Range 如果是响应部分消息，表示属于完整消息的哪个部分 Content-Range: bytes 21010-47021/47022 固定
- Content-Type 当前内容的 MIME 类型 Content-Type: text/html; charset=utf-8 固定
- Date 此条消息被发送时的日期和时间(以 RFC 7231 中定义的"HTTP 日期"格式来表示) Date: Tue, 15 Nov 1994 08:12:31 GMT 固定
- ETag 对于某个资源的某个特定版本的一个标识符，通常是一个 消息散列 ETag: "737060cd8c284d8af7ad3082f209582d" 固定
- Expires 指定一个日期/时间，超过该时间则认为此回应已经过期 Expires: Thu, 01 Dec 1994 16:00:00 GMT 固定: 标准
- Last-Modified 所请求的对象的最后修改日期(按照 RFC 7231 中定义的“超文本传输协议日期”格式来表示) Last-Modified: Dec, 26 Dec 2015 17:30:00 GMT 固定
- Link 用来表示与另一个资源之间的类型关系，此类型关系是在 RFC 5988 中定义 Link: ; rel="alternate" 固定
- Location 用于在进行重定向，或在创建了某个新资源时使用。 Location: http://www.itbilu.com/nodejs 固定
- P3P P3P 策略相关设置 P3P: CP="This is not a P3P policy! 固定
- Pragma 与具体的实现相关，这些响应头可能在请求/回应链中的不同时候产生不同的效果 Pragma: no-cache 固定
- Proxy-Authenticate 要求在访问代理时提供身份认证信息。 Proxy-Authenticate: Basic 固定
- Public-Key-Pins 用于防止中间攻击，声明网站认证中传输层安全协议的证书散列值 Public-Key-Pins: max-age=2592000; pin-sha256="……"; 固定
- Refresh 用于重定向，或者当一个新的资源被创建时。默认会在 5 秒后刷新重定向。 Refresh: 5; url=http://itbilu.com
- Server 服务器的名称 Server: nginx/1.6.3 固定
- Set-Cookie 设置 HTTP cookie Set-Cookie: UserID=itbilu; Max-Age=3600; Version=1 固定: 标准
- Status 通用网关接口的响应头字段，用来说明当前 HTTP 连接的响应状态。 Status: 200 OK
- Trailer Trailer 用户说明传输中分块编码的编码信息 Trailer: Max-Forwards 固定
- Transfer-Encoding 用表示实体传输给用户的编码形式。包括：chunked、compress、 deflate、gzip、identity。 Transfer-Encoding: chunked 固定
- Upgrade 要求客户端升级到另一个高版本协议。 Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11 固定
- Vary 告知下游的代理服务器，应当如何对以后的请求协议头进行匹配，以决定是否可使用已缓存的响应内容而不是重新从原服务器请求新的内容。 Vary: \_ 固定
- Via 告知代理服务器的客户端，当前响应是通过什么途径发送的。 Via: 1.0 fred, 1.1 itbilu.com (nginx/1.6.3) 固定
- Warning 一般性警告，告知在实体内容体中可能存在错误。 Warning: 199 Miscellaneous warning 固定
- WWW-Authenticate 表示在请求获取这个实体时应当使用的认证模式。 WWW-Authenticate: Basic 固定

## for 循环里面套 setTimeOut，打印什么？如何修改代码

1. 用 let 代替 var
2. setTimeOut 传递第三个参数

## 原型链继承 原型赋值继承 Object.create 继承优缺点，改进

### 原型链继承

特点：

1. 非常纯粹的继承关系，实例是子类的实例，也是父类的实例
2. 父类新增原型方法/原型属性，子类都能访问到
3. 简单，易于实现

缺点：

4. 要想为子类新增属性和方法，必须要在 new Animal()这样的语句之后执行，不能放到构造器中
5. 无法实现多继承
6. 来自原型对象的所有属性被所有实例共享（来自原型对象的引用属性是所有实例共享的）（详细请看附录代码： 示例 1）
7. 创建子类实例时，无法向父类构造函数传参

改进：

在继承函数里面 父类.call(this)

### 原型赋值继承

答得不好

### Object.create

答得不好

## Sticky footer 布局

```bash
<div class="wrapper clearfix">
    <div class="content">
      // 这里是页面内容
    </div>
</div>
<div class="footer">
    // 这里是footer的内容
</div>
//css
.wrapper {
    min-height: 100%;
}
.wrapper .content{
    padding-bottom: 50px; /* footer区块的高度 */
}
.footer {
    position: relative;
    margin-top: -50px;  /* 使footer区块正好处于content的padding-bottom位置 */
    height: 50px;
    clear: both;
}
.clearfix::after {
    display: block;
    content: ".";
    height: 0;
    clear: both;
    visibility: hidden;
}
```

```bash
<div class="wrapper">
    <div class="content">这里是主要内容</div>
    <div class="footer">这是页脚区块</div>
</div>
//css
.wrapper {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
.content {
    flex: 1;
}
.footer {
    flex: 0;
}
```

## 应用题：

手写 bind 方法

```javascript
Function.prototype.myBind = function(context) {
  if (typeof this !== "function") {
    throw new TypeError("Error");
  }
  const _this = this;
  const args = [...arguments].slice(1);
  // 返回一个函数
  return function F() {
    // 因为返回了一个函数，我们可以 new F()，所以需要判断
    if (this instanceof F) {
      return new _this(...args, ...arguments);
    }
    return _this.apply(context, args.concat(...arguments));
  };
};
```

```javascript
if (this instanceof F) {
  return new _this(...args, ...arguments);
}
```

这段代码使为了防止 bind 的时候 new 一个新函数，调用就调用执行判断的

对于直接调用来说，这里选择了 apply 的方式实现，但是对于参数需要注意以下情况：因为 bind 可以实现类似这样的代码 f.bind(obj, 1)(2)，所以我们需要将两边的参数拼接起来，于是就有了这样的实现 args.concat(...arguments)

## 算法题：

实现一个千分位的方法

### 123456789.22 转化为 123,456,789.22 正则和非正则

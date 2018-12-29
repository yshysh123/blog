# babel

## 常用 babel 相关技术

- babel-core： 如果某些代码需要调用 Babel 的 API 进行转码，就要使用 babel-core 模块
- babel-loader: 负责 es6 语法转化
- babel-preset-env: 包含 es6、7 等版本的语法转化规则
- babel-polyfill: es6 内置方法和函数转化垫片
- babel-plugin-transform-runtime: 避免 polyfill 污染全局变量

### babel 配置

babel 的相关配置，推荐单独写在.babelrc 文件中。DEMO：

```bash
{
  "presets": [
    [
      "env",
      {
        "targets": {
          "browsers": ["last 2 versions"]
        }
      }
    ]
  ],
  "plugins": ["transform-runtime"]
}
```

### webpack 相关配置

在 webpack 配置文件中，关于 babel 的调用需要写在 module 模块中。对于相关的匹配规则，除了匹配 js 结尾的文件，还应该去除 node_module/文件夹下的第三库的文件。

```bash
module: {
    rules: [
      {
        test: js,
        exclude: /(node_modules)/,
        use: {
          loader: "babel-loader"
        }
      }
    ]
  }
```

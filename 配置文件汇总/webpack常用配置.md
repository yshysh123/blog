### webpack-dev-server 配置

```bash
//webpack devServer配置
devServer: {
  historyApiFallback: true,
  host: '0.0.0.0',
  inline: true,
  hot: true,
  disableHostCheck: true,
  contentBase: './public',
  proxy: {
    [appConfig.baseURL]: {
      target: proxyTargets[envProxy],
      pathRewrite: { [`^${appConfig.baseURL}`]: '' },
      secure: false,
      // changeOrigin: true,
    },
  },
  port,
  https: protocal === 'https',
  after: () => {
    opn(`${protocal}://${host}:${port}`)
  },
},
```

### webpack-resolve 配置

```bash
//webpack resolve 配置
const path = require('path')
// 确保不同环境传入的路径是一样的
const resolvePath = relativePath =>
path.resolve(`${__dirname}/..`, relativePath)

const alias = {
  tool: resolvePath('./src/tool'),
  components: resolvePath('./src/components'),
  page: resolvePath('./src/page'),
  store: resolvePath('./src/store'),
  style: resolvePath('./src/style'),
  locale: resolvePath('./src/locale'),
  src: resolvePath('./src'),
  fixture: resolvePath('./**tests**/fixture'),
}
module.exports = {
  alias,
  extensions: ['.js', '.jsx', '.css', '.less', '.vue'],
}

```

### webpack-css 动态按需加载

style-loader 为 css 对象提供了 use()和 unuse()两种方法，借助这两种方法，可以方便快捷地加载和卸载 css 样式。

```bash
module: {
  rules: [
    {
      test: /\.css$/,
      use: [
        {
          loader: "style-loader/useable" // 注意此处的style-loader后面的 useable
        },
        {
          loader: "css-loader"
        }
      ]
    }
  ]
}
```

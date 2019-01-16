# webpack4.0 配置

- 首先 在根目录下创建一个 webpack.config.js，默认配置如下:

  ```bash
    module.exports = {
      entry: '',               // 入口文件
      output: {},              // 出口文件
      module: {},              // 处理对应模块
      plugins: [],             // 对应的插件
      devServer: {},           // 开发服务器配置
      mode: 'development'      // 模式配置
    }
  ```

- devServer 服务器配置需要 webpack-dev-server

  ```bash
    npm i webpack-dev-server -D
  ```

- 配置 Html 模板

  - 我们需要实现 html 打包功能，可以通过一个模板实现打包出引用好路径的 html 来，这就需要用到一个常用的插件了，html-webpack-plugin，用之前我们来安一下它

    ```bash
      npm i html-webpack-plugin -D
    ```

  - 使用方式如下
    ```bash
    let path = require('path');
    // 插件都是一个类，所以我们命名的时候尽量用大写开头
    let HtmlWebpackPlugin = require('html-webpack-plugin');
    module.exports = {
      entry: './src/index.js',
      output: {
          // 添加hash可以防止文件缓存，每次都会生成4位的hash串
          filename: 'bundle.[hash:4].js',
          path: path.resolve('dist')
      },
      plugins: [
          // 通过new一下这个类来使用插件
          new HtmlWebpackPlugin({
              // 用哪个html作为模板
              // 在src目录下创建一个index.html页面当做模板来用
              template: './src/index.html',
              hash: true, // 会在打包好的bundle.js后面加上hash串
          })
      ]
    }
    ```

- 引用 CSS 文件
  - 需要下载一些解析 css 样式的 loader
    ```bash
      npm i style-loader css-loader -D
      // 引入less文件的话，也需要安装对应的loader
      npm i less less-loader -D
    ```
  - 配置 css 文件的解析
    ```bash
      module: {
        rules: [
          {
            test: /\.css$/,     // 解析css
            use: ['style-loader', 'css-loader'] // 从右向左解析
            /*
              也可以这样写，这种方式方便写一些配置参数
              use: [
                {loader: 'style-loader'},
                {loader: 'css-loader'}
              ]
            */
          }
        ]
      }
    ```
    同时 style-loader 为 css 提供了动态加载和卸载的方法：[webpack 常用配置](./webpack常用配置.md)
  - less sass 文件同理，需要对应配置 test 和对应的 loader
- 拆分\压缩 CSS
  - 需要用到对应的拆分 CSS 的插件
    ```bash
      npm i mini-css-extract-plugin -D
    ```
  - 配置如下
    ```bash
      const MiniCssExtractPlugin = require('mini-css-extract-plugin');
      //判断是否是生产环境，如果是生产环境走MinicssExtractPlugin.loader，开发环境不压缩css，走style-loader并打开sourceMap
      const styleLoader = isProd
      ? MiniCssExtractPlugin.loader
      : {
          loader: 'style-loader',
          options: {
            sourceMap: true,
          },
        };
      module.exports = {
        module: {
          rules: [
            {
              test: /\.css$/,
              use: [styleLoader, 'css-loader']
            }
          ]
        }
        plugins: [
          new MiniCssExtractPlugin({
            filename: 'web/[name].css',
          })
        ]
      }
    ```
- 处理图片、视频、字体、svg 等等
  - 处理图片方面，也需要 loader
    ```bash
      npm i file-loader url-loader -D
      npm i svg-sprite-loader -D
    ```
  - 配置如下
    ```bash
    {
      test: /\.(jpe?g|png|gif|ico)$/,
      use: [
        {
          loader: 'url-loader',
          options: {
            limit: 10000,
            name: '/images/[hash:8][name].[ext]',
          },
        },
      ],
    },
    {
      test: /\.(mp4|webm|ogg|mp3|wav|flac|aac)(\?.*)?$/,
      loader: 'url-loader',
      options: {
        limit: 10000,
        name: '/images/[hash:8][name].[ext]',
      },
    },
    {
      test: /\.(svg)$/i,
      loader: 'svg-sprite-loader',
      include: [
        require.resolve('antd-mobile').replace(/warn\.js$/, ''),
        resolvePath('src/app/images'),
      ],
    },
    {
      test: /\.(woff2?|eot|ttf|otf|svg)(\?.*)?$/,
      exclude: [
        require.resolve('antd-mobile').replace(/warn\.js$/, ''),
        resolvePath('src/app/images'),
      ],
      use: ['url-loader?limit=10000&name=' + '/fonts/[name].[ext]?[hash]'],
    },
    ```
- 添加 CSS3 前缀
  - 通过 postcss 中的 autoprefixer 可以实现将 CSS3 中的一些需要兼容写法的属性添加响应的前缀，这样省去我们不少的时间
    ```bash
      npm i postcss-loader autoprefixer -D
    ```
  - 安装后，我们还需要像 webpack 一样写一个 config 的配置文件，在项目根目录下创建一个 postcss.config.js 文件，配置如下：
    ```bash
      module.exports = {
        plugins: [require('autoprefixer')]  // 引用该插件即可了
      }
    ```
  - 然后在 webpack 里配置 postcss-loader
    ```bash
      module.exports = {
        module: {
          rules: [
            {
              test: /\.css$/,
              use: ['style-loader', 'css-loader', 'postcss-loader']
            }
          ]
        }
      }
    ```
- 转义 ES6
  - 在实际开发中，我们在大量的使用着 ES6 及之后的 api 去写代码，这样会提高我们写代码的速度，不过由于低版本浏览器的存在，不得不需要转换成兼容的代码，于是就有了常用的 Babel 了。
    Babel 会将 ES6 的代码转成 ES5 的代码
    ```bash
      npm i babel-core babel-loader babel-preset-env babel-preset-stage-0 -D
    ```
  - 当把这些都安好后，我们就开始配置，由于要兼容的代码不仅仅包含 ES6 还有之后的版本和那些仅仅是草案的内容，所以我们可以通过一个.babelrc 文件来配置一下，对这些版本的支持
    ```bash
      // .babelrc
      {
          "presets": ["env", "stage-0"]   // 从右向左解析
      }
    ```
  - 我们再在 webpack 里配置一下 babel-loader 既可以做到代码转成 ES5 了
    ```bash
      module.exports = {
        module: {
          rules: [
            {
              test:/\.js$/,
              use: 'babel-loader',
              include: /src/,          // 只转化src目录下的js
              exclude: /node_modules/  // 排除掉node_modules，优化打包速度
            }
          ]
        }
      }
    ```
- 启动静态服务器
  - devServer 配置见[webpack 常用配置](./webpack常用配置.md)
  - 热更新还需要在入口文件内判断开启
    ```bash
      // 还需要在主要的js文件里写入下面这段代码
      if (module.hot) {
          // 实现热更新
          module.hot.accept();
      }
    ```
- resolve 解析

  - resolve 配置见[webpack 常用配置](./webpack常用配置.md)

- 提取公共代码
  - 在 webpack4 之前，提取公共代码都是通过一个叫 CommonsChunkPlugin 的插件来办到的。到了 4 以后，内置了一个一模一样的功能，而且起了一个好听的名字叫“优化”
  - 配置如下
    ```bash
      const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
      const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
      config.optimization = {
        splitChunks: {
          chunks: 'all',
          cacheGroups: {
            vendor: {
              // split `node_modules`目录下被打包的代码到 `page/vendor.js && .css`
              test: /node_modules\/react/,
              name: true,
              priority: 10,
              enforce: true,
            },
            // 将所有零散的antd样式打包
            styles: {
              name: 'styles',
              test: /\.(sc|le)ss$/,
              chunks: 'all',
              enforce: true,
            },
          },
        },
        runtimeChunk: true,
        minimizer: [
          /**
          * 参考文档http://www.css88.com/doc/webpack2/plugins/uglifyjs-webpack-plugin/
          *  JS压缩代码
          */
          new UglifyJsPlugin({
            cache: true,
            parallel: true,
            uglifyOptions: {
              /**
              * 移除console和debugger
              */
              drop_debugger: true,
              drop_console: true,
            },
            // sourceMap: true, // set to true if you want JS source maps
          }),
          /**
          * CSS压缩代码
          */
          new OptimizeCSSAssetsPlugin({}),
        ],
      };
    }
    ```

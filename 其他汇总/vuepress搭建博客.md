# 本文将讲述如何用 vuepress 搭建静态博客

## 前言

为什么要建立自己的博客？——[引自:为什么你要写博客？—陈素封](https://zhuanlan.zhihu.com/p/19743861?columnSlug=cnfeat)

1. “提高将事情讲清楚的能力”.

   在写博客之前你需要花更多的时间来表达出你的想法，表达你想法之前你得先对你要表达的东西充分理解并理清思路和逻辑。很多东西你以为懂了，但当你在写下来的时候，你就觉得无从下手了。

2. 分享带来的连锁反应

   “通过分享，你获得了直接而快速的回报，你最终或许会发现你已将版权和“保留所有权利”抛诸脑后。新的经济学准则是：参与你作品的人越多，回报越高。在分享主义里，如果你愿意你可以保留所有权，但是我乐于分享。” by 毛向辉 《分享主义：一场思维革命》

3. 记录成长

   我们每个人都应该有这样的经历:隔了很久我们回头看看以前的自己会发现特别傻 x,但正是因为这些傻 x 的岁月让我们不断成长,你在成长的过程中不断的修正自己的错误。

4. 探索未知的世界

   世界不止是你的家，你的公司，你的朋友圈，你应该去发现一个更大的世界，通过写博客，你会知道世界上还有很多人像你一样在写博客，这些人和知识正在世界的某个角落在等着你。

5. 帮助更多想要获取帮助的人

   这点我相信大家由为感触,在你探索一个未知的知识领域的时候,往往被撞的一鼻子灰.幸运的人很快就能找到一个“师傅”或一篇很好的文章,但大多数往往在找“教程”的过程中就已经放弃了.因为他们没能够找到刚好理解的文章.

## 准备工作

- github 账号一枚
- node 环境（推荐使用最新稳定版，至少 8.0.0 以上）
- git bash

## 1.开始搭建 Github Pages

1. 注册属于你自己的 Github 账号
2. 创建仓库（当你的仓库名称是：用户名.github.io 时候，会默认开启 Github Page=>步骤 3）
3. 开启 Github Pages

## 2.入手搭建 vuepress 博客

### 首先先看一下 vuePress 的特性

- 为技术文档而优化的 内置 Markdown 拓展
- 在 Markdown 文件中使用 Vue 组件的能力
- Vue 驱动的自定义主题系统
- 自动生成 Service Worker
- oogle Analytics 集成
- 基于 Git 的 “最后更新时间”
- 多语言支持
- 多种默认主题

### 下面让我们来进行搭建：

1. 全局安装 VuePress

```bash
yarn global add vuepress # 或者：npm install -g vuepress
```

2. 新建文件夹并进入

选好一个项目路径，可以 windows 下手动创建文件夹 也可以用 linux 命令创建

```bash
mkdir vuePress
```

进入刚才创建的文件夹

```bash
cd vuePress
```

3. 项目初始化

```bash
yarn init -y # 或者 npm init -y
```

稍等片刻，在文件夹下会出现一个文件：package.json，打开看看

```javascript
{
  "name": "vuePress",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

4. 在这个文件夹下创建 docs 文件夹

这个文档将作为项目文档的根目录来使用：

```bash
mkdir docs
```

5. 在 docs 文件夹下创建.vuepress 文件夹：

```bash
mkdir .vuepress
```

所有 VuePress 相关的文件都将会被放在这里

6. 在.vuepress 文件夹下面创建 config.js:

```bash
touch config.js
```

config.js 是 VuePress 必要的配置文件，它导出一个 javascript 对象。

你可以先加入如下配置：

```javascript
module.exports = {
  title: "Hello VuePress",
  description: "Just playing around"
};
```

7. 在.vuepress 文件夹下面创建 public 文件夹:

```bash
mkdir public
```

这个文件夹是用来放置静态资源的，打包出来之后会放在.vuepress/dist/的根目录。

8. 首页(像 VuePress 文档主页一样)

- 在 docs 文件夹下面创建一个 README.md：
- 默认的主题提供了一个首页，像下面一样设置 home:true 即可，可以把下面的设置放入 README.md 中，待会儿你将会看到跟 VuePress 一样的主页。

```javascript
---
home: true
heroImage: /头像.png
actionText: 快速上手 →
actionLink: /guide/
features:
  - title: 简洁至上
    details: 以 Markdown 为中心的项目结构，以最少的配置帮助你专注于写作。
  - title: Vue驱动
    details: 享受 Vue + webpack 的开发体验，在 Markdown 中使用 Vue 组件，同时可以使用 Vue 来开发自定义主题。
  - title: 高性能
    details: VuePress 为每个页面预渲染生成静态的 HTML，同时在页面被加载的时候，将作为 SPA 运行。
footer: MIT Licensed | Copyright © 2019-present Sihong Yu
---
```

ps：你需要放一张图片头像.png 到 public 文件夹中。

到此我们的项目结构已经搭好了：

```bash
project
├─── docs
│ ├── README.md
│ └── .vuepress
│ ├── public
│ └── config.js
└── package.json
```

在 package.json 里添加两个启动命令:

```javascript
{
  "scripts": {
    "docs:dev": "vuepress dev docs",
    "docs:build": "vuepress build docs"
  }
}
```

启动你的 VuePress：
默认是 localhost:8080 端口。

```bash
yarn docs:dev # 或者：npm run docs:dev
```

构建：
build 生成静态的 HTML 文件,默认会在 .vuepress/dist 文件夹下

```bash
yarn docs:build # 或者：npm run docs:build
```

基本配置：

最标准的当然是官方文档,可以自己的需求来配置 config.js。
可以参考一下我的 config.js 的配置：

```javascript
module.exports = {
  title: "yush的博客",
  description: "网站描述",
  // 注入到当前页面的 HTML <head> 中的标签
  head: [
    ["link", { rel: "icon", href: "/favicon.ico" }] // 增加一个自定义的 favicon(网页标签的图标)
  ],
  base: "/", // 这是部署到github相关的配置 下面会讲
  markdown: {
    lineNumbers: true // 代码块显示行号
  },
  themeConfig: {
    sidebarDepth: 2, // e'b 将同时提取 markdown 中 h2 和 h3 标题，显示在侧边栏上。
    lastUpdated: "Last Updated",
    serviceWorker: {
      updatePopup: true // Boolean | Object, 默认值是 undefined.
      // 如果设置为 true, 默认的文本配置将是:
      // updatePopup: {
      //    message: "New content is available.",
      //    buttonText: "Refresh"
      // }
    }
  }
};
```

导航栏配置：

```javascript
module.exports = {
  themeConfig: {
    nav: [
      {
        text: "博文",
        items: [
          {
            text: "React学习汇总",
            link: "/react/"
          },
          {
            text: "使用 GitHub Pages 和 VuePress 搭建网站",
            link: "/vuepress/"
          }
        ]
      },
      {
        text: "关于",
        link: "/about/"
      },
      {
        text: "GitHub",
        items: [{ text: "GitHub地址", link: "https://github.com/yshysh123" }]
      }
    ]
  }
};
```

侧边栏配置：

侧边栏的配置相对麻烦点，我里面都做了详细的注释，仔细看，自己鼓捣鼓捣 就知道怎么搞了。

```javascript
module.exports = {
themeConfig: {
  sidebar:{
    "/guide/": [
      {
        title: "Titanium Guides",
        collapsable: false,
        children: ["prerequisites", "getting-started", "first-app"]
      }
    ],
    "/react/": [
      {
        title: "React学习总结",
        collapsable: true,
        children: [
          "classnames",
          "propTypes",
          "react16-hooks",
          "react生命周期",
          "react_comp"
        ]
      }
    ],
    "/about/": [
      ["", "README"],
      ["GithubPages", "GithubPages"],
      ["VuePress", "VuePress"]
    ]
  }
}
```

一个命令行发布到 github 上：

在 project 的根目录下，创建一个 deploy.sh 文件：

```bash
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io  USERNAME=你的用户名
git push -f https://github.com/yshysh123/yshysh123.github.io master

# 如果发布到 https://<USERNAME>.github.io/<REPO>  REPO=github上的项目
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -
```

设置 package.json：

```bash
{
  "scripts": {
    "d": "bash deploy.sh"
  }
}
```

部署：

然后你每次可以运行下面的命令行，来把最新更改推到 github 上：

```bash
npm run d
```

最终的 package.json 文件如下：

```bash
"scripts": {
  "dev": "vuepress dev docs", // 本地运行项目 npm run dev
  "build": "vuepress build docs", // 构建项目 nom run build
  "d": "bash deploy.sh" // 部署项目 npm run d
},
```

结语

以上就是如何利用 vuepress 和 github 的 page 搭建一个个人博客的详细教程了。相信跟着我的步骤，一步一步的来，很快就能搭建成功咯。

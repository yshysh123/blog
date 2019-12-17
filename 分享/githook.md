启用严格检查的提交格式
为什么要启用严格检查的提交格式？
知乎上有个问题: 如何写好 Git commit log? 很有意思, 能看到各种提交风格: 有用 emoji 的, 有用唐诗的, 有用随机生成的. 风格没有对错, 只要能够体现出 commit 所做的修改即可.

提供更多的历史信息，方便快速浏览。
可以过滤某些commit（比如文档改动），便于快速查找信息。
可以直接从commit生成Change log。Change Log 是发布新版本时，用来说明与上一个版本差异的文档，详见后文。
目前规范使用较多的是 Angular 团队的规范, 继而衍生了 Conventional Commits specification. 很多工具也是基于此规范, 它的 message 格式如下:

```
<type>(<scope>): <subject>
// 空一行
<body>
// 空一行
<footer>
```

标题行: 必填, 描述主要修改类型和内容

主题内容: 描述为什么修改, 做了什么样的修改, 以及开发的思路等等
页脚注释: 放 Breaking Changes 或 Closed Issues
不管是哪一个部分，任何一行都不得超过72个字符（或100个字符）。这是为了避免自动换行影响美观。

针对 type，业界通用的选项如下
 feat: 特性
build: 构建相关的修改
ci: 持续集成相关的修改
fix: bug修正
docs: 文档
style: 样式修改
perf: 性能优化
refactor: 和特性修正无关的重构，例如重命名
test: 测试 revert: 由于上面的某个错误提交，生成恢复代码的一次提交
chore: 不包含在上面选项中的其他情况
  参考commit message change log

  不同的lint规则，可选的type可能稍有不同，比如较严格的规则不允许chore这种范围太宽泛的选项。

安装工具之前需要初始化nodejs项目环境，运行：
yarn init

工具commintlint 检测每次提交的格式核心代码。
工具commintlint-cli commintlint的命令行工具。
按照文档，安装工具：
yarn add commitlint @commitlint/prompt-cli 
规则集@commintlint/config-conventional检测每次提交的格式。
该规则较宽松，angular的相对严格，取消了chore选项。

配置文件commitlint.config.js，放到项目根目录
module.exports = { extends: ['@commitlint/config-conventional'] }

 工具husky/yorkie，将commitlint绑定到git的commit-msg提交钩子上，在每次生成提交前调用commitlint检测提交文字格式，不通过验证则无法生成提交。
此处我使用yorkie作为例子 安装：

yarn add yorkie

在package.json文件中添加提交消息验证

"gitHooks": {
  "commit-msg": "npx commitlint -E GIT_PARAMS"
}

1. git hooks分为服务器hook和本地hook，此处讲的全部都是本地hook。
2. 详细的hooks说明需要看官方文档，想不起来的时候，可以快速看一下当前项目里的`.git/hooks`文件夹，里面的文件就是当前本地git支持的hook，这些文件都是见名知意的。
3. 用相同的思路，还可以在其他的git hooks中注入回调命令，例如pre-commit/pre-push自动运行测试，不通过则阻止提交/推送。
工具commitizen 一个命令行下，用交互的方式生成合规的提交格式的工具，对于还不熟悉提交消息格式的人起到自动生成合规消息的作用，可有可无。
安装过程

yarn add commitizen
yarn add cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > .czrc

安装完毕之后，即可使用git-cz命令代替git commit提交。

经过了上面对提交文字的规范，即可达到自动生成changelog的目的。

工具conventional-changelog-cli，自动提取提交记录，根据当前package.json中的version版本号，生成当前发布版本的CHANGELOG.md。
安装：

yarn add conventional-changelog-cli

添加脚本到package.json

rm CHANGELOG.md && npx conventional-changelog -p angular -i CHANGELOG.md -s -r 10

conventional-changelog有很多可调整的参数，具体参考文档 conventional-changelog-cli即可。

关于版本号的问题，一般格式为1.2.3，分为三段，为主版本号，次版本号，修正版本号。
主版本号 当前程序经过重构，生成了与之前版本不兼容的api，则主版本号升级。
次版本号 每次新feature的添加，即升级次版本号。
修正版本号 每次bug修正引起的升级，即升级修正版本号。 在首个稳定版本发布之前，会有试用版标识，例如：2.0.0-beta.1，2.0.0-beta.2等，从beta进化到正式版的第一个版本应为2.0.0。
 每次发布，需要变更版本号，才需要生成changelog，而不是经常随时生成。  每次发布前需要做两件事。

根据实际情况，升级package.json中的版本号。

运行changelog命令，生成本次发布CHANGELOG.md日志。

参考语义化版本

执行

yarn changelog
windows下面可以配置个命令行："commit": "git-cz",

OK，搞定

最后安利下提交图片的格式：https://github.com/muwenzi/Program-Blog/issues/71

commit message 的规范性很重要, 但是是否需要像本文这样强制限制, 每个团队和个人都有自己的想法, 但是个人认为: 好的习惯, 受益终身.
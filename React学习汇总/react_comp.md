# 如何开发高度复用的 React UI 组件

## 前言

本次分享中，我将通过示例代码，讲解如何高效开发可用的 React UI 组件。

## 提问: 现在开源 UI 组件已经很成熟了，为什么还要自己开发 UI 组件呢？

总结了大概 3 点：

1. 学习。开发过程中也是一种学习的过程，通过自己开发组件，可以更好地理解开源组件的内部原理，从而更好地指导我们使用。
2. 改造。项目中，难免会用到一些开源库中没有的 API 或功能。由此可以更快更效率的对开源库进行改造。
3. 定制化。开发整套组件，可以更好地应对公司、部门的定制化项目。保证 UI 的统一。例如：JDReact-Native

## 准备: 前端环境

1. 首先我们需要 ES6 环境，所以需要对应的 babel
2. 编写组件，代码的规范和提交的规范是必不可少的。参考[代码规范和提交规范](https://github.com/rmbf2e/frondend-git)
3. 需要测试我们的组件。对应的 Jest 配置
4. 需要展示组件。可以用成熟的展示库 storebook 等等
5. 发布组件。

## 第一部分: 了解组件需要的参数及方法

成熟的开源库中，一般在组件展示页面底部我们都能看到一个 API 表格:

|   属性   |     说明     |  类型   | 默认值 |
| :------: | :----------: | :-----: | :----: |
| disabled |   失效状态   | boolean | false  |
| loading  | 设置载入状态 | boolean | false  |

在我们开发一个组件的初期，可以从成熟组件入手，看看一个高度可复用的组件需要传入什么参数：可参考 [antd](https://ant.design/) 及 [element-UI](http://element.eleme.io/#/)。

有了参考，我们要进一步对入参进行筛选过滤。

举个例子：一个 Button 组件，我提炼出来的属性有

```bash
loading,
disabled,
block,
type,
className,
htmlType,
onClick,
size,
href,
dashed,
```

对应属性，我们可以生成如下表格：
| 属性 | 说明 | 类型 | 默认值 |
| :------ | :---------- | :-----: | :----: |
| disabled | 按钮失效状态 | boolean | false |
| href | 点击跳转的地址，指定此属性 button 的行为和 a 链接一致 | string | - |
| htmlType | 设置 button 原生的 type 值 | string | button |
| loading | 设置按钮载入状态 | boolean | false |
| size | 设置按钮大小，可选值为 small large 或者不设 | string | default |
| type | 设置按钮类型，可选值为 primary dashed danger(版本 2.7 中增加) 或者不设 | string | - |
| onClick | 点击按钮时的回调 | (event) => void | - |
| block | 将按钮宽度调整为其父宽度的选项 | boolean | false |

参数确定之后，在编写组件之前，我们需要对组件的参数进行校验。React 恰恰给我们提供了一个这样的校验工具集：

- 工具[prop-types](https://www.npmjs.com/package/prop-types)
  安装

```bash
yarn add prop-types
```

简易使用方法：

```bash
static propTypes = {
  // 你可以定义一个js原始类型的prop,默认请情况下，这是都是可选的
  optionalArray: React.PropTypes.array,
  optionalBool: React.PropTypes.bool,
  optionalFunc: React.PropTypes.func,
  optionalNumber: React.PropTypes.number,
  optionalObject: React.PropTypes.object,
  optionalString: React.PropTypes.string,
  optionalSymbol: React.PropTypes.symbol,

  // 任何可以渲染的东西：数字，字符串，元素或数组（或片段）。
  optionalNode: React.PropTypes.node,

  // React元素
  optionalElement: React.PropTypes.element,

  // 你也可以声明prop是某个类的实例。 内部使用的是JS的instanceof运算符。
  optionalMessage: React.PropTypes.instanceOf(Message),

  // 你可以通过将它作为枚举来确保你的prop被限制到特定的值。
  optionalEnum: React.PropTypes.oneOf(['News', 'Photos']),

  // 可以是许多类型之一的对象
  optionalUnion: React.PropTypes.oneOfType([
    React.PropTypes.string,
    React.PropTypes.number,
    React.PropTypes.instanceOf(Message)
  ]),

  // 某种类型的数组
  optionalArrayOf: React.PropTypes.arrayOf(React.PropTypes.number),

  // 具有某种类型的属性值的对象
  optionalObjectOf: React.PropTypes.objectOf(React.PropTypes.number),

  // 采取特定样式的对象
  optionalObjectWithShape: React.PropTypes.shape({
    color: React.PropTypes.string,
    fontSize: React.PropTypes.number
  }),

  // 你可以用`isRequired`来连接到上面的任何一个类型，以确保如果没有提供props的话会显示一个警告。
  requiredFunc: React.PropTypes.func.isRequired,

  // 任何数据类型
  requiredAny: React.PropTypes.any.isRequired,

  // 您还可以指定自定义类型检查器。 如果检查失败，它应该返回一个Error对象。 不要`console.warn`或throw，因为这不会在`oneOfType`内工作。
  customProp: function(props, propName, componentName) {
    if (!/matchme/.test(props[propName])) {
      return new Error(
        'Invalid prop `' + propName + '` supplied to' +
        ' `' + componentName + '`. Validation failed.'
      );
    }
  },

  // 您还可以为`arrayOf`和`objectOf`提供自定义类型检查器。 如果检查失败，它应该返回一个Error对象。
  // 检查器将为数组或对象中的每个键调用验证函数。
  // 检查器有两个参数，第一个参数是数组或对象本身，第二个是当前项的键。
  customArrayProp: React.PropTypes.arrayOf(function(propValue, key, componentName, location, propFullName) {
    if (!/matchme/.test(propValue[key])) {
      return new Error(
        'Invalid prop `' + propFullName + '` supplied to' +
        ' `' + componentName + '`. Validation failed.'
      );
    }
  })
};
```

💡: 由于我们使用的是 eslint airbnb 的校验规则集，组件内使用的任何 props 都需要定义 propTypes 以及 defaultProps。

```bash
static propTypes = {
  prefixCls: PropTypes.string,
  href: PropTypes.string,
  type: PropTypes.oneOf([
    'primary',
    'default',
    'warning',
    'success',
    'error',
    'info',
    'danger',
    'disabled',
  ]),
  htmlType: PropTypes.string,
  loading: PropTypes.bool,
  block: PropTypes.bool,
  disabled: PropTypes.bool,
  size: PropTypes.oneOf(['small', 'default', 'large']),
}
```

💡 对应校验入参应该都有默认值。

```bash
static defaultProps = {
  prefixCls: 'xx-button',
  href: '',
  type: 'default',
  htmlType: 'button',
  loading: false,
  block: false,
  disabled: false,
  size: 'default',
}
```

## 第二部分: 根据 props 开发具体组件代码

开发的常用 UI 组件，HTML 里面基本都有涉及。例如 Radio，CheckBox，Input，Button，Color 选择器，日期选择器等等。

我们需要做的，就是在 HTML 基本选择器上，把 Step1 的 props 添加进去，让组件更灵活。

还是以 Button 为例子：一个没有任何样子的 Button 应该是长这个样子：

```javascript
<button type="button">Click Me!</button>
```

对应 Click Me！位置应该是我们用 Button 组件包裹的子元素，对应 Vue 里面的 slot。改造一下变成：

```javascript
<button type="button">{this.props.children}</button>
}
```

OK 下面就对 Step1 的 props 进行注入，首先我们先划分下功能：

| 属性     | 功能划分                            | 代码划分 |
| :------- | :---------------------------------- | :------: |
| disabled | 不可点击：onClick 失效，CSS 改变    | JS、CSS  |
| href     | button 标签改变为 a 标签            |    JS    |
| htmlType | 设置 button                         |    JS    |
| loading  | 增加 Icon loading，onClick 失效     |    JS    |
| size     | 只需要修改 CSS 改变 button 宽高即可 |   CSS    |
| type     | 根据 type 值修改对应的 css 颜色     |   CSS    |
| onClick  | button 中不需要对 click 做包装      |    JS    |
| block    | 修改 display 属性、宽度属性         |   CSS    |

### 首先我们先来处理 JS 的部分

```javascript
/*
从props里面拿到所有的参数
*/
const { loading, disabled, children, onClick, href } = this.props;
// 根据disabled和loading状态，判断onClick是否可点击
const isDisabled = disabled || loading ? { disabled: true } : { onClick };
//定义所有参数集合（目前只有一个、其他都是css的）
const baseProps = {
  ...isDisabled
};
//判断loading状态，增加loading状态图标
const content = (
  <React.Fragment>
    {loading && (
      <span>
        <Icon type="loading" />
        &nbsp;
      </span>
    )}
    <span>{children}</span>
  </React.Fragment>
);
//判断是否有href参数，有则为a标签。
if (href) {
  return (
    <a href={disabled ? "#" : href} disabled={disabled}>
      {content}
    </a>
  );
}
//正常返回button
return (
  <button type="button" {...baseProps}>
    {content}
  </button>
);
```

## 第三部分: 利用 classnames，给组件美化

- 工具[classnames](https://www.npmjs.com/package/classnames)
  安装

```bash
yarn add classnames
```

具体用法：

- 普通使用

```bash
import classNames from 'classNames';

classNames('foo', 'bar'); // => 'foo bar'
classNames('foo', { bar: true }); // => 'foo bar'
classNames({ 'foo-bar': true }); // => 'foo-bar'
classNames({ 'foo-bar': false }); // => ''
classNames({ foo: true }, { bar: true }); // => 'foo bar'
classNames({ foo: true, bar: true }); // => 'foo bar'
classNames({ foo: true, bar: false }); // => 'foo'
```

- 在 react 中使用

```bash
import classNames from 'classNames';

render() {
  let prefixCls = 'button';
  const className= classNames(prefixCls, {
    [`${prefixCls}-primary`]: true,
    [`${prefixCls}-warning`]: true,
    [`${prefixCls}-success`]: true,
    [`${prefixCls}-error`]: true,
    [`${prefixCls}-default`]: true,
    [`${prefixCls}-normal`]: true,
    [`${prefixCls}-info`]: true,
    [`${prefixCls}-disabled`]: true,
    [`${prefixCls}-loading`]: true,
  };
  return <button className={className}>Hello World</button>;
}
```

下面就可以根据 Step2 中的和 CSS 有关的样式写出一份 className 集合：

```bash
static defaultProps = {
  prefixCls: 'button',
}
static propTypes = {
  prefixCls: PropTypes.string
}
const {
  loading,
  disabled,
  block,
  prefixCls,
  type,
  className,
  size,
  ...attr
} = this.props

const checkType = btnType => type === btnType

const baseProps = {
  className: cls(prefixCls, {
    [`${prefixCls}-primary`]: checkType('primary'),
    [`${prefixCls}-warning`]: checkType('warning'),
    [`${prefixCls}-success`]: checkType('success'),
    [`${prefixCls}-error`]: checkType('error'),
    [`${prefixCls}-danger`]: checkType('danger'),
    [`${prefixCls}-default`]: !disabled && checkType('default'),
    [`${prefixCls}-normal`]: checkType('default'),
    [`${prefixCls}-info`]: checkType('info'),
    [`${prefixCls}-disabled`]: disabled,
    [`${prefixCls}-loading`]: loading,
    [`${prefixCls}-block`]: block,
    [`${prefixCls}-large`]: size === 'large',
    [`${prefixCls}-small`]: size === 'small',
    className,
  }),
}
```

再将对应的 baseProps 注入到 button 中。这样一来，根据 props，button 会被打上不同的 class 名称。

接下来，只需要在 css 文件里面将这些 class 一一实现即可。

- 工具[less](https://www.npmjs.com/package/less)
  安装

```bash
yarn add less
```

我们的 css 采用的预处理工具是 less。具体代码这里就不贴出来了。列举几点细节：

- 将有可能在其他组件内使用的样式定义成变量。例如：color，background-color，border-color
- 将相同的 class 内部的方法通过 less 函数传递不同 color 色值

```bash
&.@{prefixcls}-warning {
  .button-hover(@warning-color);
}
&.@{prefixcls}-primary {
  .button-hover(@primary-color);
}
//less函数接收color
button-hover(@color: @default-color, @font-color: #fff) {
  color: @font-color;
  background-color: @color;
  border: 1px solid @color;
}
```

## 第四部分: 添砖加瓦

开篇的时候说了。开发 UI 组件的目的除了学习之外还有定制化和改造。这部分内容是让我们的组件与众不同的地方。

举个例子： antd 的组件 同样的 button 组件。

从源码中我们可以看到，antd 的 button 组件被一个叫 Wave 的标签包裹：

```bash
<Wave>
</Wave>
```

Wave 组件，就是给被包裹的元素点击的时候增加一个水波纹效果。

又或者[material-UI](https://material-ui.com/demos/buttons/#buttons)效果等等。

总而言之，第四部分就是给我们的组件做定制化的地方。小伙伴们可以尽情的发挥自己的想象，让我们的组件与众不同。

## 第五部分: 单元测试

一个成熟的组件，单元测试是必不可少的。这里推荐使用 Jest+enzyme

这里简单举个例子：

```bash
import React from 'react'
import { render, shallow } from 'enzyme'
import Button from 'button'

it('should can trigger click event', () => {
  const onClick = jest.fn()
  const wrapper = shallow(<Button onClick={onClick}>button</Button>)
  wrapper.find('button').simulate('click')
  expect(onClick).toHaveBeenCalled()
})
```

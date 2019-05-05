# PIXI.Text

文本对象 PIXI.Text 是指创建一行或多行文字，可以使用'\n'来实现换行，文本对象 PIXI.Text 的继承关系是：

PIXI.Text->PIXI.Sprite

文本 PIXI.Text 的创建代码如下：

```javascript
var text = new PIXI.Text('This is a pixi text', {
    fontFamily: 'Arial',
    fontSize: 24,
    fill: 0xff1010,
    align: 'center',
})
```

注）其中参数 1 是文本内容，参数 2 是文本样式。

## PIXI.Text 的方法

1. text.setText(text) ->设置文案
2. text.setStyle(style) ->设置样式 Obj

## PIXI.Text 的使用

使用 PIXI.Text 需要设置字体文件的 x，y 坐标 然后插入 PIXI 容器

Demo：

```javascript
const container = new PIXI.Container()
const basicText = new PIXI.Text(`+${number}`, {
    fontFamily: 'Arial',
    fontSize: 50,
    fontWeight: 'bold',
    fill: '#fffc00',
})
basicText.x = 10
basicText.y = 0
container.addChild(basicText)
this.canvasApp.stage.addChild(container)
```

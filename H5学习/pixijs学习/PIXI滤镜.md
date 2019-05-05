# PIXI 滤镜

滤镜主要是用来实现图像的各种特殊效果。在显示对象中用属性 filters 表示，要移除滤镜只需把此属性设为 null 即可。系统提供的滤镜有：

1. BlurFilter
2. BlurXFilter
3. BlurYFilter
4. ColorMatrixFilter
5. DisplacementFilter
6. FXAAFilter
7. NoiseFilter
8. VoidFilter

DEMO:

```javascript
var bg = PIXI.Sprite.fromImage('../img/BGrotate.jpg')
bg.width = app.renderer.width
bg.height = app.renderer.height
app.stage.addChild(bg)
var littleDudes = PIXI.Sprite.fromImage('../img/panda.png')
littleDudes.position.x = 100
littleDudes.position.y = 100
app.stage.addChild(littleDudes)
var blurFilter1 = new PIXI.filters.BlurFilter()
littleDudes.filters = [blurFilter1]
var count = 0

app.ticker.add(function() {
    count += 0.01
    var blurAmount = Math.cos(count)
    blurFilter1.blur = 20 * blurAmount
})
```

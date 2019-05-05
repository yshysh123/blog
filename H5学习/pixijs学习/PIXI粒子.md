# PIXI 粒子

粒子容器 PIXI.particles.ParticleContainer 是一个能容纳大量显示精灵的容器，其具有快速、高效的特点，支持容期内显示对象的位置变化、大小缩放和角度旋转；然而出于性能的考虑，同时也屏蔽了容器内显示对象如基色变化、遮罩层等特效功能。粒子容器继承于 PIXI.Container。创建方法如下：

```javascript
new PIXI.particles.ParticleContainer(maxSize, properties, batchSize)
```

该函数中，maxSize 表示最大容纳量；properties 表示设置粒子容器的属性；batchSize 表示每批渲染对象的数量，默认值与 maxSize 一样。

完整 DEMO:

```javascript
//创建粒子容器
var sprites = new PIXI.particles.ParticleContainer(10000, {
    scale: true,
    position: true,
    rotation: true,
    uvs: true,
    alpha: true,
})
app.stage.addChild(sprites)

//创建粒子
var totalSprites = app.renderer instanceof PIXI.WebGLRenderer ? 10000 : 100
for (var i = 0; i < totalSprites; i++) {
    var dude = PIXI.Sprite.fromImage('../img/bunny.png')
    //设置中心点
    dude.anchor.set(0.5)
    //设置不同缩放值
    dude.scale.set(0.8 + Math.random() * 0.3)
    // 随机出现位置
    dude.x = Math.random() * app.renderer.width
    dude.y = Math.random() * app.renderer.height
    // 设置不同的颜色
    dude.tint = Math.random() * 0x808080
    //添加到粒子容器中
    sprites.addChild(dude)
}
```

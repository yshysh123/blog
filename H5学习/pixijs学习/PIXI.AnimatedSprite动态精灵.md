# PIXI AnimatedSprite 动态精灵

直接 Demo

```javascript
this.visible_skier = new this.Sprite(this.resources.people_false.texture)
this.visible_skier.visible = false
this.visible_skier.name = 'visible_people'
// people 帧动画
const texture = PIXI.Texture.fromImage(
    'https://n2-q.mafengwo.net/s12/M00/F8/7F/wKgED1w2ueOAf3HBAAA_lW3LjcI756.png',
)
const cutnum = 10
const width = parseInt(texture.width / cutnum, 0)
const height = parseInt(texture.height, 0)
const frameArray = []
for (let i = 0; i < cutnum; i += 1) {
    const rectangle = new PIXI.Rectangle(i * width, 0, width, height)
    const frame = new PIXI.Texture(texture, rectangle)
    frameArray.push(frame)
}
// 播放动画
this.skier = new PIXI.extras.AnimatedSprite(frameArray)
this.skier.name = 'people'
this.visible_skier.x = parseInt(
    this.leftTrackWidth +
        (this.rowWidth - this.visible_skier.width) / 2 +
        this.rowWidth,
    0,
)
this.visible_skier.y = this.cvsHeight - this.visible_skier.height - 150
this.skier.x = this.visible_skier.x
this.skier.y = this.visible_skier.y
this.skier.animationSpeed = parseFloat((20 / 120).toFixed(2))
this.skier.play()
this.canvasApp.stage.addChild(this.skier, this.visible_skier)
```

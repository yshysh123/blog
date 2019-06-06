# PIXI 入门

## PIXI 需要学习的内容

1. 创建画布-Application 舞台-stage 和渲染器 -renderer
2. 创建精灵，并把精灵加入画布
3. 让精灵动起来
4. 碰撞检测
5. 游戏结束监测
6. 游戏重新开始

## DEMO

1.  创建 PIXI 画布

```javascript
createApplication() {
    /* 获取PIXI的DOM元素画布，类似于canvas的画布 */
    const wrap = document.querySelector('.PIXI');
    this.Application = PIXI.Application;
    this.loader = PIXI.loader;
    this.resources = PIXI.loader.resources;
    this.Sprite = PIXI.Sprite;
    this.canvasApp = new this.Application({
        width: this.cvsWidth,
        height: this.cvsHeight,
        antialiasing: true,
        transparent: true,
        resolution: 1,
    });
    this.canvasApp.renderer.view.style.position = 'fixed';
    this.canvasApp.renderer.view.style.top = '0px';
    this.canvasApp.renderer.view.style.left = '0px';
    this.canvasApp.renderer.view.style.display = 'block';
    this.canvasApp.renderer.view.style.width = `${this.cvsWidth / 2}px`;
    this.canvasApp.renderer.view.style.height = `${this.cvsHeight / 2}px`;
    wrap.appendChild(this.canvasApp.view);
    /*
        this.LOADER_IMG是一个由图片组成的数组，传入给PIXI.loader进行绘制
        之后执行setupEle进行分别绘制场景
    */
    this.loader.add(this.LOADER_IMG).load(this.setupEle); // loader img
},
```

2. 加载图片背景和精灵

```javascript
mounted(){
    //Pixi强大的loader对象可以用来做图片的预加载。以下代码显示了如何加载图片，并在图片加载完成后执行setup回调。
    PIXI.loader
    .add(this.resources)
    .load(this.drawRoad);
}
drawRoad() {
     //This code will run when the loader has finished loading the image
    this.road = new this.Sprite(this.resources.ROAD.texture);
    this.road.name = 'road';
    this.road.x = this.randomInt(0, this.cvsWidth);
    this.road.y = -this.road.height;
    this.road.vy = this.speed;
    this.canvasApp.stage.addChild(this.road);
},
```

4. 碰撞监测函数实现及碰撞监测功能实现

```javascript
hitTestRectangle(r1, r2) {
    const newR1 = r1;
    const newR2 = r2;
    let hit = false;

    newR1.centerX = newR1.x + (newR1.width / 2);
    newR1.centerY = newR1.y + (newR1.height / 2);
    newR2.centerX = newR2.x + (newR2.width / 2);
    newR2.centerY = newR2.y + (newR2.height / 2);

    newR1.halfWidth = r1.width / 2;
    newR1.halfHeight = r1.height / 2;
    newR2.halfWidth = r2.width / 2;
    newR2.halfHeight = r2.height / 2;

    const vx = newR1.centerX - newR2.centerX;
    const vy = newR1.centerY - newR2.centerY;

    const combinedHalfWidths = newR1.halfWidth + newR2.halfWidth;
    const combinedHalfHeights = newR1.halfHeight + newR2.halfHeight;

    if (Math.abs(vx) < combinedHalfWidths) {
        if (Math.abs(vy) < combinedHalfHeights) {
            hit = true;
        } else {
            hit = false;
        }
    } else {
        hit = false;
    }
    return hit;
},
```

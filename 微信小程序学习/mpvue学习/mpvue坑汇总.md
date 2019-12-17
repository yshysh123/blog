1. 微信保存图片到相册saveImageToPhotosAlbum方法，在开发环境中开启不校验HTTPS域名没问题，生产环境，测试版中，需要将域名添加进配置文件，或者全部使用马蜂窝域名下的图片，值得注意的是，微信小程序获取用户头像的域名，如果不加特殊处理 是https://wx.qlogo.cn域名的。 2种解决方案：1.将这个域名添加到微信小程序downloadFile的合法域名中。 2.后端进行处理，在获取到用户头像之后进行CDN转译，将域名处理成CDN域名返回给前端。
2. /chopprice/getData/sharePop  =>获取小程序的扫描二维码接口，如果要带参数，在path参数后拼接?xxx=xxx&yyy=yyy是不行的，需要另一个参数来进行支持，scene:`shareId=${this.chopGoodsId}&&chopId=${shareId || ''}` 在onLoad接受options参数的时候，会对这个options.scene进行转码，所以要对"="和"&&"进行转码操作。

3. formId 现在微信小程序不支持嵌套发送多个id的形式了。因此如果需要发送多个不同的FormId，尽可能将FormId绑定在不同点击事件上。方便后端获取Form而发送push

4. mpvue的生命周期，在进入页面的时候，之前该页面的所有data下的数据不会重置，需要手动重置。这点非常恶心。具体可参考这个：https://github.com/Meituan-Dianping/mpvue/issues/140。目前的解决方案是在onUnload的时候手动清除。目前issue中较为可靠的方法是使用：https://github.com/HelloZJW/mpvue-page-factory 这个库来处理。或者：
```
const dataArr = []
 
export default {
  onLoad() {
    Object.assign(this.$data, this.$options.data())
    // fetch some data
    dataArr.push({ ...this.$data })
  },
  onUnload() {
    dataArr.pop()
    const dataNum = dataArr.length
    if (!dataNum) return
    Object.assign(this.$data, dataArr[dataNum - 1])
  },
}
```
5. mpvue分享或者海报扫描进来的用户或者本人，由于已经开启了小程序，所以不执行生命周期onLoad。故所有的参数和onLoad执行的方法不会从新执行,解决方案：在onLoad函数中只管保存参数,在onShow函数中从新改变页面状态及请求接口.

6. 页面分享出去，从分享链接或者扫码进来的用户，是没有左上角返回首页或者上一页面的。目前的几种解决方案：1.所有页面自定义顶部栏。工作量比较大，而且需要判断是回首页还是回退 2.在分享页增加按钮 返回首页。工作量比较小  3. 分享进来，先跳转到首页，然后首页判断是否是分享进来的，如果是分享进来的。捕获参数，捕获参数之后立马跳转到分享页，带参数跳转   
```bash
//获取全局的page变量，拿到puppeter的实例
const page = await browser.newPage()
//设置默认浏览器视口宽高，以用于打开浏览器的宽高
await page.setViewport({
  width: 1920,
  height: 1080,
})
//浏览器去的页面位置
await page.goto(String)
```

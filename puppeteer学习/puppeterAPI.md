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

- puppeteer.launch 启动浏览器实例
- browser.newPage() 创建一个新页面
- page.goto 进入指定网页
- page.screenshot 截图
- page.type 获取输入框焦点并输入文字
- page.keyboard.press 模拟键盘按下某个按键，目前 mac 上组合键无效为已知 bug
- page.waitFor 页面等待，可以是时间、某个元素、某个函数
- page.frames() 获取当前页面所有的 iframe，然后根据 iframe 的名字精确获取某个想要的 iframe
- iframe.\$('.srchsongst') 获取 iframe 中的某个元素
- iframe.evaluate() 在浏览器中执行函数，相当于在控制台中执行函数，返回一个 Promise
- page.click() 点击一个元素
- iframe.\$eval() 相当于在 iframe 中运行 document.queryselector 获取指定元素，并将其作为第一个参数传递
- iframe.\$\$eval 相当于在 iframe 中运行 document.querySelectorAll 获取指定元素数组，并将其作为第一个参数传递

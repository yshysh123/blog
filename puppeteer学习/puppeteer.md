## Puppeteer 的每一步操作都是一个异步请求，因此要用到 generator 的语法糖 async 和 await。

1. puppeteer.launch()

【作用】：启动浏览器。

【返回值】：promise。

【常用参数】：

headless
是否开启浏览器的无头模式。默认值为 true。设为 false 后，抓包的时候，浏览器将打开可见，否则不可见。

executablePath
设置执行抓包的浏览器的路径。默认会查找 node_modules/puppeteer/.local-chromium 路径。可手动自行配置。数据类型为字符串。

timeout
等待浏览器实例启动的最大毫秒数，超过这个时间则报超时错误。默认为 30000。设为 0 则禁用此项参数。数据类型为 Number。

2. browser.newPage()

【作用】：开启浏览器新窗口。

【返回值】：promise。

3. page.setViewport()

【作用】：配置窗口信息。

【返回值】：promise。

width
窗口的宽度。单位为 px 。

height
窗口的高度。单位为 px 。

deviceScaleFactor
设备实际缩放比。默认值为 1 。

isMobile
是否开启手机模式。默认为 false 。

hasTouch
是否支持 touch 事件。默认为 false 。

isLandscape
是否开启横屏模式。默认为 false 。

4. page.goto(url, options)

【作用】：当前窗口加载固定 url 地址页。url 需要以 https 开头。

【返回值】：promise。

5. page.waitFor()

【作用】：当前代码等待某某条件成功后继续执行后面代码。

【返回值】：promise。

该方法的参数有很多种，通常我们只需要传入毫秒数即可，程序会暂停我们指定的时间，然后再继续执行后面的代码。

6. page.waitForSelector()

【作用】：当前代码等待页面渲染出某个 DOM 元素后继续执行后面代码。

【返回值】：promise。

7. page.\$()

【作用】：获取当前页面的某个元素，类似于 document.querySelector() ，如果找不到，则返回 null 。

【返回值】：promise <ELement>。

8. page.\$\$()

【作用】：获取当前页面的某类元素，类似于 document.querySelectorAll() ，如果找不到，则返回一个空数组。

【返回值】：promise <Array>。

9. page.\$eval(selector, pageFunction[, ...args])

【作用】：获取当前页面的某个元素，然后在 pageFunction 里面对获取的元素进行处理。

【返回值】：promise。

10. page.\$\$eval(selector, pageFunction[, ...args])

【作用】：获取当前页面的某类元素，然后在 pageFunction 里面对获取的元素数组进行处理。

【返回值】：promise。

11. browser.close()

【作用】：关闭所有浏览器窗口并退出 Chromium 浏览器。Browser 对象也将会被销毁。

【返回值】：promise。

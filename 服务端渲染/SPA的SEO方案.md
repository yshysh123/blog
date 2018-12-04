# SPA的多种SEO方案

  * Next.js以及Nuxt.js
    * 首先，摘取一段解释，什么是服务端渲染？？？
      服务端渲染，是指页面的渲染和生成由服务器来完成，并将渲染好的页面返回客户端。而客户端渲染是页面的生成和数据的渲染过程是在客户端（浏览器或APP）完成。

      随着前后端分离模式的兴起，从服务端渲染到服务端渲染的演进，前端Web App给前端开发带来了很大的便利，并减轻后端服务器压力。

      前后端解耦，让前端专注做好用户UI层，专注于提升用户体验，让后端专注于业务逻辑处理，分离成微服务，专心做好一件事。

      前后端分离前的服务端渲染技术有：PHP，ASP，JSP等方式，分离后的前端SPA（单页面应用）渲染拥有独立的路由和页面渲染（React，Vue和Angular等），而SPA的最大问题是对SEO不友好，当项目对SEO有需求时，SPA就不是一个好的选择。

      近两年来，React和Vue也开始支持服务端渲染（Server Side Render ），行业内也有这方面的实践，其中掘金就使用Vue的SSR功能做了全站服务端渲染，且效果良好。

      Reactjs对应的服务端渲染框架：Next.js 以及Vue的框架Nuxt.js
  * prerender预渲染
    * 之前做过一个vue的预渲染项目，基本步骤就是把SPA的单页面通过webpack的Vue插件Prerender-spa-plugin进行分割

      ```bash
      const PrerenderSpaPlugin = require('prerender-spa-plugin')
      new PrerenderSpaPlugin({
        // Absolute path to compiled SPA
        staticDir:path.join(__dirname, '../dist'),
        // 列出需要预渲染的路由名称
        // 如果没有对应的路由，也会生成对应的目录
        routes:['/', '/pageA', '/pageB', '/pageC', '/pageD', '/pageE']
      }),
      ```

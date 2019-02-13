## 导航的跳转和返回

```bash
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '导航展示01',
      home: new FirstScreen(),
    ),
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('导航页面1'),
        ),
        body: Center(
          /**
           * RaisedButton凸起按钮 2个参数
           * child 内容
           * onPressed 按下动作的响应事件
           */
          child: RaisedButton(
            child: Text('这是一个按钮'),
            onPressed: () {
              Navigator.push(
                context,
                /**
                 * MaterialPageRoute路由组件
                 * 下个页面直接builder
                 */
                MaterialPageRoute(
                  builder: (context) => new SecondScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('导航页面2'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('这是另一个页面'),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          ),
        ),
      ),
    );
  }
}

```

## 父页面向子页面传递参数

```bash
import 'package:flutter/material.dart';

/*
 * 声明商品列表属性抽象
 * 类：2个参数
 * 构建：传入参数
 */
class Product {
  final String title; //商品标题
  final String description; //商品描述
  Product(this.title, this.description);
}

/*
 * 入口文件
 */
void main() {
  runApp(MaterialApp(
    title: '导航的数据传递和接收',
    home: ProductList(
      products: List.generate(
        20,
        (i) => Product('商品 $i', '这是一个商品详情，编号 $i'),
      ),
    ),
  ));
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            //点击事件
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProdectDetail(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProdectDetail extends StatelessWidget {
  final Product product;
  ProdectDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Center(
        child: Text('${product.description}'),
      ),
    );
  }
}

```

## 子页面向父页面传递参数

```bash
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '页面跳转返回数据',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情编码"),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateToProduct(context);
      },
      child: Text('去商品详情'),
    );
  }

  _navigateToProduct(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Product()),
    );

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$result'),
    ));
  }
}

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是一个商品'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('商品1'),
              onPressed: () {
                Navigator.pop(context, '商品1:1111111');
              },
            ),
            RaisedButton(
              child: Text('商品2'),
              onPressed: () {
                Navigator.pop(context, '商品2:2222222');
              },
            ),
            RaisedButton(
              child: Text('商品3'),
              onPressed: () {
                Navigator.pop(context, '商品3:3333333');
              },
            ),
          ],
        ),
      ),
    );
  }
}

```


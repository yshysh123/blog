### stlss 回车

```dart
class name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
```

### stful 回车 会生成动态组件

```dart
class name extends StatefulWidget {
  _nameState createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: child,
    );
  }
}
```

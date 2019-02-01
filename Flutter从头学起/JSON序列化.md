# JSON 序列化

## 在 Flutter 中，通常使用 2 种 JSON 序列化方式

- 手动序列化
- 使用第三方工具进行自动序列化

### 对较小的项目使用手动序列化

手动 JSON 解码是指使用内置的 JSON 解码器 dart:convert。它涉及将原始 JSON 字符串传递给 jsonDecode() 函数，然后在结果中查找所需的值 Map<String, dynamic>。它没有外部依赖性或特定的设置过程，它有利于快速验证概念。

当项目变大时，手动解码效果不佳。手动编写解码逻辑可能变得难以管理且容易出错。如果在访问不存在的 JSON 字段时出现拼写错误，则代码会在运行时抛出错误。

```bash
jsonString = {
  "name": "John Smith",
  "email": "john@example.com"
}
```

```bash
Map<String, dynamic> user = jsonDecode(jsonString);

print('Howdy, ${user['name']}!');
print('We sent the verification link to ${user['email']}.');
```

### 使用第三方工具包生成中大型项目

使用代码生成的 JSON 序列化意味着有一个外部库为您生成编码样板。进行一些初始设置后，您将运行一个文件监视器，从您的模型类生成代码。例如， json_serializable 和 built_value 就是这些类型的库。

这种方法适用于较大的项目。不需要手写的样板文件，并且在编译时捕获访问 JSON 字段时的拼写错误。代码生成的缺点是它需要一些初始设置。此外，生成的源文件可能会在项目导航器中产生视觉混乱。

以 json_serializable 为例子

1. 安装 json_serializable

```bash
dependencies:
  # Your other regular dependencies here
  json_annotation: ^2.0.0

dev_dependencies:
  # Your other dev_dependencies here
  build_runner: ^1.0.0
  json_serializable: ^2.0.0
```

2. 使用 json_serializable

```bash
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.name, this.email);
  String name;
  String email;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

3. 生成 json_serializable 代码

还记得我们刚才添加的 build_runner 的依赖吗，这时候我们就需要它来帮忙咯。

我们在当前项目的目录下运行 flutter packages pub run build_runner build

运行成功后我们应该能在这个实体类的下面发现一个新的文件

这个 data.g.dart 就是 build_runner 根据 JsonSerializable 生成的 json 解析文件。

4. 使用反序列化

```bash
factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
Map<String, dynamic> toJson() => _$UserToJson(this);
```

5. TOJSON

```bash
Map<String ,dynamic> map = json.decode("jsondata");

Data data = Data.fromJson(json.decode('jsondata'));
```

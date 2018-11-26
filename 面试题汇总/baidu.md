# 百度面试题

## 1、实现一个函数，判断输入是不是回文字符串。

```bash
function run(input) {
  if (typeof input !== 'string') return false;
  return input.split('').reverse().join('') === input;
}
```

## 2、两种以上方式实现已知或者未知宽度的垂直水平居中。

```bash
// 1
.wraper {
  position: relative;
  .box {
    position: absolute;
    top:50%;
    left:50%;
    width:100px;
    height:100px;
    margin: -50px 0 0 -50px;
  }
}
// 2
.wraper {
  position: relative;
  .box {
    position: absolute;
    top:50%;
    left:50%;
    transform: translate(-50%, -50%);
  }
}
// 3
.wraper {
  .box {
    display: flex;
    justify-content:center;
    align-items: center;
    height:100px;
  }
}
// 4
.wraper {
  display: table;
  .box {
    display: table-cell;
    vertical-align: middle;
  }
}
```

## 3、请简单实现双向数据绑定mvvm。

```bash
<input id="input" />

const data = {};
const input = document.getElementById('input');
Object.defineProperty(data, 'text', {
  set(value) {
    input.value = value;
    this.value = value;
  }
});
input.onChange = function(e) {
  data.text = e.target.value;
}
```
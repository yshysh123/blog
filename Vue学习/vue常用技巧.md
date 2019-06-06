# vue 常用技巧

## 点中改变 class 的技巧

```bash
<span v-for="(val, index) in tab" :key="index" :class="{on : tabIndex === index}" @click="tabClick(index)">
    {{val}}
</span>
```

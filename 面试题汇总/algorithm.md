```
/**
 * 冒泡排序
 * @param       : <Array> target数组
 * @description : 冒泡排序，更贴切的形容应该是沉底排序，每一轮内循环就是最大数沉底了。
 */
function bubbleSort(target) {
  for(var j = target.length; j > 0; j--) {
    for(var i = 0; i < j - 1; i++) {
      if(target[i] > target[i + 1]) {
        target.swap(i, i + 1);
      }
    }
  }
  return target;
};
```

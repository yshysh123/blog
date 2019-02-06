```
/**
 * 交换数组中两元素位置
 * @param       : i, j: 待交换的两元素下标
 */
Array.prototype.swap = function(i, j) {
  const temp = this[i];
  this[i] = this[j];
  this[j] = temp;
}

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

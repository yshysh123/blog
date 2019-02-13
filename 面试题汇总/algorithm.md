# 排序

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

## 冒泡排序 

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

## 选择排序 

/**
 * 选择排序
 * @param       : <Array> target数组
 * @description : 一次内循环得到最大值的下标，然后只交换一次次序，将最大值和内循环末尾对调。
 */
function selectSort(target) {
  for(var j = target.length; j > 0; j--) {
    var maxIndex = 0;
    for(var i = 1; i < j; i++) {
      maxIndex = target[maxIndex] > target[i] ? maxIndex : i;
    }
    target.swap(maxIndex, j - 1);
  }
  return target;
};
```
# 查找

## 二分查找
```bash
function binarySearch(data, dest){
    let h = data.length - 1,
        l = 0;
    while(l <= h){
        var m = Math.floor((h + l) / 2);
        if(data[m] == dest){
            return m;
        }
        if(dest > data[m]){
            l = m ++;
        }else{
            h = m --;
        }
    }
    return false;
}
```

# 排序

## 通用排序方法

```javascript
/**
 * 交换数组中两元素位置
 * @param       : i, j: 待交换的两元素下标
 */
Array.prototype.swap = function(i, j) {
  const temp = this[i];
  this[i] = this[j];
  this[j] = temp;
};
```

## 冒泡排序

```javascript
/**
 * 冒泡排序
 * @param       : <Array> arr数组
 * @description : 冒泡排序，更贴切的形容应该是沉底排序，每一轮内循环就是最大数沉底了。
 */
function bubbleSort(arr) {
  for (var i = 0; i < arr.length - 1; i++) {
    for (var j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        arr.swap(j, j + 1);
      }
    }
  }
  return arr;
}
```

## 选择排序

```javascript
/**
 * 选择排序
 * @param       : <Array> arr数组
 * @description : 一次内循环得到最大值的下标，然后只交换一次次序，将最大值和内循环末尾对调。
 */
function selectSort(arr) {
  for (var j = arr.length; j > 0; j--) {
    var maxIndex = 0;
    for (var i = 1; i < j; i++) {
      maxIndex = arr[maxIndex] > arr[i] ? maxIndex : i;
    }
    arr.swap(maxIndex, j - 1);
  }
  return arr;
}
```

## 插入排序

```javascript
/**
 * 插入排序
 * @param       : <Array> arr数组
 * @description : 即将元素插入到已排序好的数组中。
 */
function insertSort(arr) {
  for (let i = 1; i < arr.length; i++) {
    //外循环从1开始，默认arr[0]是有序段
    for (let j = i; j > 0; j--) {
      //j = i,将arr[j]依次插入有序段中
      if (arr[j] < arr[j - 1]) {
        [arr[j], arr[j - 1]] = [arr[j - 1], arr[j]];
      } else {
        break;
      }
    }
  }
  return arr;
}
```

## 快速排序

```javascript
/**
 * 快速排序
 * @param       : <Array> arr数组
 * @description : 循环原数组，小的放左边(left数组)，大的放右边(right数组);concat(left, base, right)
 */
function quickSort(arr) {
  if (arr.length <= 1) {
    return arr; //递归出口
  }
  var left = [],
    right = [],
    current = arr.splice(0, 1);
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < current) {
      left.push(arr[i]); //放在左边
    } else {
      right.push(arr[i]); //放在右边
    }
  }
  return quickSort(left).concat(current, quickSort(right));
}
```

# 查找

## 二分查找

```javascript
function binarySearch(data, dest) {
  let h = data.length - 1,
    l = 0;
  while (l <= h) {
    var m = Math.floor((h + l) / 2);
    if (data[m] == dest) {
      return m;
    }
    if (dest > data[m]) {
      l = m++;
    } else {
      h = m--;
    }
  }
  return false;
}
```

# 斐波那契数列

```javascript
function cStairs(n) {
  if (n === 1 || n === 2) {
    return 1;
  } else {
    return cStairs(n - 1) + cStairs(n - 2);
  }
}
```


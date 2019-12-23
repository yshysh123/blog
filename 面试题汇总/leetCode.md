# leetCode 算法题目

## 1.两数之和

给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。

示例:
给定 nums = [2, 7, 11, 15], target = 9
因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]

```javascript
var twoSum = function(nums, target) {
  const map = new Map();
  for (let i = 0; i < nums.length; i++) {
    if (map.has(target - nums[i])) {
      return [map.get(target - nums[i]), i];
    }
    map.set(nums[i], i);
  }
};
```

## 股票问题

假设把某股票的价格按照时间先后顺序储存在数组中，请问买卖该股票一次可能获得的最大利润是多少？例如，一只股票在某些时间节点的价格为{9,11,8,5,7,12,16,14}。如果我们能在价格为5的时候买入并在价格为16的时候卖出，则能收获最大的利润11。

```javascript
int MaxDiff(const int *numbers, unsigned length) {
    if (numbers == NULL || length < 2)return 0;
 
    int min = numbers[0];
    int resu = numbers[1] - min;
 
    for (int i = 2; i != length; i++) {
        //检查前一天的值是不是最小值，是就更新最小值
        if (numbers[i-1] < min) {
            min = numbers[i-1];
        }
        //当前时间卖出能赚到最多的钱吗
        if ((numbers[i] - min) > resu) {
            resu = numbers[i] - min;
        }
    }
    return resu;
}
```

void main() {
  //常用的两种定义方式
  var map1 = Map();
  var map2 = {"a": "this is a", "b": "this is b", "c": "this is c"};
  //长度属性 输出0
  print(map1.length);
  //获取值 输出this is a
  print(map2["a"]);
  //如果没有key返回null
  print(map1["a"]);

  //需要注意的是keys和values是属性不是方法
  print(map2.keys); //返回所有key 输出(a, b, c)
  print(map2.values); //返回所有value 输出(this is a, this is b, this is c)

  //key:value的类型可以指定
  var intMap = Map<int, String>();
  //map新增元素
  intMap[1] = "数字1";
  //key错误类型不正确
  //intMap['a'] = "a";
  intMap[2] = "数字2";
  //value错误类型不正确
  //intMap[2] = 2;
  //删除元素
  intMap.remove(2);
  //是否存在key 输出true
  print(intMap.containsKey(1));
}

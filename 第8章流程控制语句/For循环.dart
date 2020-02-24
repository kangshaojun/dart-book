void main() {
  //定义一个数组
  var messages = [];
  //定义数组长度
  int length = 5;
  //计数器
  int i = 0;
  //使用for循环
  for (i; i < length; i++) {
    //向数组里添加元素
    messages.add(i.toString());
  }
  //打印数组内容
  print(messages.toString());

  //forEach迭代输出
  messages.forEach((item){
      print(item);
  });

  //for in语句迭代输出
  for(var x in messages) {
    print(x);
  }

}

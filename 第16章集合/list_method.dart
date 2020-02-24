//list_method.dart文件
void main(){

  //初始List
  List myList=['张三','李四','王五'];
  print(myList);
  //添加元素
  myList.add('赵六');
  print(myList);
  //拼接数组
  myList.addAll(['张三','李四']);
  print(myList);
  //indexOf查找数据 查找不到返回-1  查找到返回索引值
  print(myList.indexOf('小张'));
  //向指定索引位置插入数据
  myList.insert(0, '王小二');
  print(myList);
  //删除指定元素
  myList.remove('赵六');
  //删除指定索引处的元素
  myList.removeAt(1);
  print(myList);

  //将List元素按指定元素拼接
  var str = myList.join('-');
  print(str);
  print(str is String);  //true

  //将字符串按指定元素拆分并转换成List
  var list=str.split('-');
  print(list);
  print(list is List);

  var tempList = [1,"2",3,34532,555];
  //这个方法的执行逻辑是将List中的每个元素拿出来和map(f)中传入的f函数条件进行比较
  //如果符合条件就会返回true，否则就会返回false
  var testMap = tempList.map((item) => item.toString().length == 1);
  print(testMap);

  //查找列表中满足条件的数据，条件由传入的函数参数决定
  var testWhere = tempList.where((item) => item.toString().length == 3);
  print(testWhere);

}
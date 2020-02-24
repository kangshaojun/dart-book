//set_property.dart文件
void main(){
  Set set = Set.from(['香蕉', '苹果', '葡萄']);
  //返回第一个元素
  print(set.first);
  //返回最后一个元素
  print(set.last);
  //返回元素的数量
  print(set.length);
  //集合只有一个元素就返回元素，否则异常
  //print(set.single);
  // 集合是否没有元素
  print(set.isEmpty);
  // 集是否有元素
  print(set.isNotEmpty);
  // 返回集合的哈希码
  print(set.hashCode);
  // 返回对象运行时的类型
  print(set.runtimeType);
  // 返回集合的可迭代对象
  print(set.iterator);
}
//map_property.dart文件
void main(){
  Map<String, int> map = {"a":1, "b":2, "c":3};
  //返回集合的哈希码
  print(map.hashCode);
  //集合上是否没有键值对
  print(map.isEmpty);
  //集合上是否有键值对
  print(map.isNotEmpty);
  //返回集合的所有键
  print(map.keys);
  //返回集合的所有值
  print(map.values);
  //返回集合上键值对的数目
  print(map.length);
  //返回对象运行时的类型
  print(map.runtimeType);
}
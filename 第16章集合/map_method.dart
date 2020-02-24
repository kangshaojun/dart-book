//map_method.dart文件
void main(){
  Map<String, int> map = {"a":1, "b":2, "c":3};
  //返回集合的字符串表示
  print(map.toString());
  //添加其他键值对到集合中
  map.addAll({"d":4, "e":5});
  //集合是否包含指定键
  print(map.containsKey("d"));
  //集合是否包含指定值
  print(map.containsValue(5));
  //删除指定键值对
  map.remove("a");
  //删除所有键值对
  map.clear();
}
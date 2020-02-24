//set_method.dart文件
void main(){
  Set set = Set.from(["A", "B", "C"]);
  //添加一个值
  set.add("D");
  print(set);
  //添加一些值
  set.addAll(["E", "F"]);
  print(set);
  //以字符串输出集合
  print(set.toString());
  //将集合的值用指定字符连接，以字符串输出
  print(set.join(","));
  //集合是否包含指定值
  print(set.contains("C"));
  //集合是否包含一些值
  print(set.containsAll(["E", "F"]));
  //返回集合指定索引的值
  print(set.elementAt(1));
  //删除集合的指定值，成功则返回true
  print(set.remove("A"));
  //删除集合的一些值
  set.removeAll(["B", "C"]);
  //删除集合的所有值
  set.clear();
}
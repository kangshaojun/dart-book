//set_for_each.dart文件
void main(){
  //初始化集合
  Set set = Set.from(["A", "B", "C"]);

  print('使用for...in输出集合元素');
  //使用for...in输出集合元素
  for(var item in set) {
    print(item);
  }

  print('使用toList.forEach输出集合元素');
  //使用toList.forEach输出集合元素
  set.toList().forEach((value){
    print(value);
  });
  
}
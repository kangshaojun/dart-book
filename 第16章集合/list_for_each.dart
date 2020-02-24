//list_for_each.dart文件
void main(){

  List list = [1, 2, 3, 4, 5];

  print('使用forEach迭代每个元素');
  //遍历每个元素,此时不可add或remove,否则报错但可以修改元素值
  list.forEach((element){
    element += 1;
    //直接修改list对应index的值
    list[2] = 0;
  });
  //输出列表值
  print(list);

  //使用for循环遍历每个元素
  print('使用for循环遍历每个元素');
  for(var i = 0; i<list.length; i++){
    print(list[i]);
  }

  //使用for...in遍历每个元素
  print('使用for...in遍历每个元素');
  for(var x in list){
    print(x);
  }

}
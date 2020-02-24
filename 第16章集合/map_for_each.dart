//map_for_each.dart文件
void main(){

  Map<String, int> map = {"a":1, "b":2, "c":3};
  print('通过forEach迭代Map集合');
  //按顺序迭代映射
  map.forEach((key, value){
    print(key + " : " + value.toString());
  });


  Map<String, int> scores = {'0000001': 36};
  print('通过for...in迭代Map集合');
  for (var key in ['0000001', '0000002', '0000003']) {
    //查找指定键，如果不存在就添加
    scores.putIfAbsent(key, (){
      return 80;
    });
    //通过key访问其值
    print(scores[key]);
  }
}
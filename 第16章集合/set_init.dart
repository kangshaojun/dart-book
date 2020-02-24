//set_init.dart文件
void main(){
  //实例化Set
  Set set = Set();
  //添加元素
  set.add('香蕉');
  set.addAll( ['苹果', '西瓜'] );
  print(set);

  //通过from方法初始化Set
  Set setFrom = Set.from(['葡萄', '哈密瓜', '苹果',null]);
  print(setFrom);
}
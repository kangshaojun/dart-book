//generics_constructor.dart文件
void main(){

  var names = List<String>();
  names.addAll(['张三', '李四']);
  //构造方法参数必需为String类型
  var nameSet = Set<String>.from(names);
  print(nameSet);

}